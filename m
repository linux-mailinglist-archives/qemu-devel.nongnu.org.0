Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B45E8A03
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 10:18:32 +0200 (CEST)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc0Mp-0004Ql-RR
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 04:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0E9-0005ge-Ag; Sat, 24 Sep 2022 04:09:33 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:38422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0E7-0004ry-U9; Sat, 24 Sep 2022 04:09:33 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 3so1428113qka.5;
 Sat, 24 Sep 2022 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ROryWQb4yK6mmfcP98J+zscNQ9RGDGxwQHBbQIMtLiE=;
 b=YYWV4Kc6Qd/hmNaKsK5N06S/Mi/M3yyyeDn89hyH+NYKgmFm+436UE/HTaEUySb9GM
 m+SEMNAUtQNXG09p08ZICneUTFeIfV2hf9Qc+RJdpyZJdmpx0TyPFbgjMs+wBheFfn5d
 pHAB+kgzCNVbF2hBJCBrFgYjgBHm4Y6fKAgspEnGt8J3PopEH5zG0GHpEXuW7OdzokrS
 DY647TLQcPt4796d+zuTcqkR++6/oJ6ZQDhL4Ci+Ju+ZDPZS2ZOkGFPZHYAvx9fKo5lT
 apPihvvbrei1/pOsD49O5bs9S4YJmah3ecP+/OPF+Sy38B4BuG94EuDQ0JX5Qk5MO2+6
 dkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ROryWQb4yK6mmfcP98J+zscNQ9RGDGxwQHBbQIMtLiE=;
 b=VJce12MF0L9qRMyzBMHq1HAEGAbUh8c+A//xp6Hcm01ncYdfamUhxBOwPcrIcv02Be
 VYm03PaZxgOm6VqGe3LdeM/FYkj9PxzEbVaV6W6tCl2nvm2MYiYR90fCsdoJ2UktRppF
 HcvEoi2eqG8oneEfzg/lJQSoneIOTSmE54POdJsGWk8V6ptJN9SmGdm7Jo2f22YYz9SW
 L0YMBWuClw+TtlAnbzR50tRmP4wT9KBmb25Yb07GPb9zpoHwB3WW9ojrfhMTLGVhULNH
 X1iWAVl+g4dNar2Gz76n5Y5riFtpdvQZc8jhVG9tzLYmS0hqEvq6SnCiwDhlI3sOOl6L
 DUlg==
X-Gm-Message-State: ACrzQf0WvwgqVnsgvY9iDQS85C/gMCkrhsoQdVMUJIZ03jt9pg4RrGP9
 HDxNV3wQciuRjGhAIF1YdqftCW8BW8kGdHQptiU=
X-Google-Smtp-Source: AMsMyM7r+i40YwKi2Fm3mdIS+5OdwYqibOm9ZK3TUfZjznlR9kMwXffSwP1OH2RJpz0g2mHo2q9K00Y0kMOW/eIPKl8=
X-Received: by 2002:ae9:e410:0:b0:6cb:e230:8df8 with SMTP id
 q16-20020ae9e410000000b006cbe2308df8mr7890391qkc.132.1664006970528; Sat, 24
 Sep 2022 01:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-4-bmeng.cn@gmail.com>
 <CAJ+F1CJqeQUrK+ky6XE_XSMmof-hLC0RgBD+nR1Q+X+RX9UrZw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJqeQUrK+ky6XE_XSMmof-hLC0RgBD+nR1Q+X+RX9UrZw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 16:09:20 +0800
Message-ID: <CAEUhbmXVxQFQ2MvqT2JZnE92=e7Si1CKXxHhE8n6xqK9o8py-A@mail.gmail.com>
Subject: Re: [PATCH v2 03/39] block: Unify the get_tmp_filename()
 implementation
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 23, 2022 at 3:39 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 2:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> At present get_tmp_filename() has platform specific implementations
>> to get the directory to use for temporary files. Switch over to use
>> g_get_tmp_dir() which works on all supported platforms.
>>
>
> As discussed in v1, there are other things to do while touching this code=
. And since it is optional for the series goal, please send this as a diffe=
rent patch/series.
>

Okay, a separate patch has just been sent.

Regards,
Bin

