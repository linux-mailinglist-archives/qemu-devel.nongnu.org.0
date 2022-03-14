Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1304D8AA4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:17:41 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToKC-0008Rk-6F
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:17:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nToIm-00074f-2j
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:16:12 -0400
Received: from [2607:f8b0:4864:20::b29] (port=35601
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nToIk-0004jW-28
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:16:11 -0400
Received: by mail-yb1-xb29.google.com with SMTP id o5so3274399ybe.2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tkewatqzdyfAyBocS8TceGtSNsMg1Cl+8GyEt5Y93Oo=;
 b=JAaSEegmrIeZh/OXlPAjTlUPl4NbuxnnCgiyimCqvd6y7WUy9x9KarUNicMGmz49fi
 7S3ODb7TIXLFpjIRjfwKbzJOYEf82fZIDJCaJqToq+Co4rte8DVhIC3qh55DIvxVP9IN
 vZFRzYL+5nqZ/pSYjpX2nd+6dzxoL6Q7gpT0ZnbFjc85otIadjrG3BYDhrk3AF66DQBd
 W3+V5kv7EdJbfvdldF6OeYvIePNmdQx6OiRN2LCv6L5+3fJJxmKzaV3efClAerzZ++dW
 nTn33Wt32vH/luFvdlrr1Ng9rqlNzqvs51ju5WzJt/t/4XN3EfQPuBaPmz1+DJjeZN5r
 dicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tkewatqzdyfAyBocS8TceGtSNsMg1Cl+8GyEt5Y93Oo=;
 b=2T/FH9JbkSQg8Je/S7L+b2Q4GFs6iIMsnDP+Z/iBpTNJrJzNKonxvNV3h3Ulf33j85
 YFREfk3C83F44i998of9Oqet6Ed7P6WEKSqMCEGUatlNt6iizXzilAbK1Oog+mDrx8Hi
 /l1GNt0G8f9WxAmiu7gFVW1/Vhf0ovgdDeggZV5uz0+NalVQ4zq2244vCtwtKYQPtguG
 0D4wLAmsBS3vefJHs85vKUZtM1m1GSh2/fxabCvvaKOmNPXNyFQe3cBqW1dLyCuZJ07C
 h18ir0ph+YcXy0Jn01FqLS7J3sVHUhwNkxGINN7gjzZm+CXuA+xj3Ypbe5kvG2oG0cPB
 p0jA==
X-Gm-Message-State: AOAM5318haw5EMWBaoeyaQltqLzwiyPFlK/RBYSgXZxrz7dUufLPuACx
 a3KNyAaYzpfKzoQ8BmfsIqGjD9S004LoOU+whF9NLQ==
X-Google-Smtp-Source: ABdhPJwDZ2Y/8gq+2Zgcz8bQrL1KZIDyAgIWbn1NRf4chwGoVsO42OUaJgvbMae9GSY85L31fCPzSwIPrx61Uqt6xQE=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr18692574ybg.85.1647278168890; Mon, 14
 Mar 2022 10:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
In-Reply-To: <Yi92SN2Z3OZi82pS@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 17:15:57 +0000
Message-ID: <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
Subject: Re: [PULL 00/18] migration queue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, quintela@redhat.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:07, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> So the test harness is waiting for a reply to 'query-migrate'.
>
> This should be fast unless QEMU has hung in the main event
> loop servicing monitor commands, or stopped.

I was kind of loose with the terminology -- I don't remember whether
it was actually hung in the sense of stopped entirely, or just
"sat in a loop waiting for a migration state that never arrives".
I'll try to look more closely if I can catch it in the act again.

One thing that makes this bug investigation trickier, incidentally,
is that the migration-test code seems to depend on userfaultfd.
That means you can't run it under 'rr'.

-- PMM

