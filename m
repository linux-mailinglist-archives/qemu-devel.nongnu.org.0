Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C05A8E7C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 08:45:00 +0200 (CEST)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdwe-0003Sy-Hb
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 02:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTdtY-0001Lb-Ba; Thu, 01 Sep 2022 02:41:45 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTdtV-0001mB-Iy; Thu, 01 Sep 2022 02:41:43 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 193so7288119ybc.10;
 Wed, 31 Aug 2022 23:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=1xP9W3TZ6nt51E2Dw5QHwVWjoSYRyXk0jiej3TnUfhU=;
 b=JoA4DlRk+BEDgqlD9dlTQ7swsR7+QTmvS2dITa4RsBx8B2Qbi4Lwz99Algu1f9ZxP8
 KRCcBFUiX4lqu66vrf8M5jP+FEuN/fl5BkPiy85qdM5ZXT54ggxcmKVfwRX2o18og4p/
 fpAKb1I7SGGIZHBgQ6kCu051uKJmJqZBJ71He1JphMNAGqqVz0PRSRt2GbMjtpJcJwof
 tm8pv/ne9xIIXTaLLhC+hdAEapAsx0xVnBfvAeTbEn42uVPLv4VlPFdO6+pOSHs52utf
 x/yFg/UvnR2pjsFNme7XrHxierCH4r1CzUgQ3w8HUAf9LZ2ZbOvAWfHBSyzASQT5W4of
 /QEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=1xP9W3TZ6nt51E2Dw5QHwVWjoSYRyXk0jiej3TnUfhU=;
 b=BwoDUK2DIwun8MU+WNLPkjBStN0jkfKjVQJzxNcBHi18qPF0k+o8PMIGauhpZlfJUa
 goyOfMsoEt1fXfgNZG/PdsshCblzRdRNITX0vUHvbKJrR2mYo+Me3kL0l8V5cxwOmGxa
 EnKdh4xW37n/vhLKD+4UCq8VtQ55XmqP9sG5Q+arFJcyJy+sMl/x/c99jV082Rx7umnW
 Xk0NJsbpZjMb/u9SFDU998+LQlWp5ZZ537VJilkfgKmeWzTfpoJKh+V9aTOEcOXKc+tC
 h/ZgK0xsTC9ygp4pEb4hqL1YULkuNMqIWoBnuNJDbhyBGqIQFGiHTVEP+vZXbNagxTH5
 Np5g==
X-Gm-Message-State: ACgBeo14R25BW/LaJnTtrVls2V8Psnhn9nwnkMRn0yKWXmxUTokCssC9
 NenYcawRSWr4JFD6qnRyV0mdiqX4Omy8IdrurF0=
X-Google-Smtp-Source: AA6agR4/Ehho9wTmNO5Z5nsLI/sePbR+UOZkemXR/CjukHa9zBrS0RDWex89tQZZxtEh8/eegiHyVZJL3TYaSYtojKQ=
X-Received: by 2002:a05:6902:10c3:b0:69a:ae8:1600 with SMTP id
 w3-20020a05690210c300b0069a0ae81600mr15708351ybu.227.1662014500048; Wed, 31
 Aug 2022 23:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-4-bmeng.cn@gmail.com>
 <CAJ+F1CJAb-jz8=4hwDhpUQbbtXj_SoW44TwOmuH8MQWagbrD5Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CJAb-jz8=4hwDhpUQbbtXj_SoW44TwOmuH8MQWagbrD5Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Sep 2022 14:41:28 +0800
Message-ID: <CAEUhbmV5dpCiKMtrDfYR7PEZGF9dVaTd1um3PY2AkF3A1cVARQ@mail.gmail.com>
Subject: Re: [PATCH 03/51] block: Unify the get_tmp_filename() implementation
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-Andr=C3=A9,

On Wed, Aug 31, 2022 at 8:54 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Bin
>
> On Wed, Aug 24, 2022 at 1:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> At present get_tmp_filename() has platform specific implementations
>> to get the directory to use for temporary files. Switch over to use
>> g_get_tmp_dir() which works on all supported platforms.
>>
>
> It "works" quite differently though. Is this patch really necessary here?

Without this patch the qtest cases builds on Windows do not have any
problem. So it is optional. I put it in the same series as it has the
same context of using hardcoded /tmp directory name.

>
> If yes, please explain why.
>
> If not, I suggest you drop optional / rfc / "nice to have" patches from t=
he series. It will help to get it merged faster.

I can drop this single patch and send another single patch if this is
the desired practice.

>
> thanks

Regards,
Bin

