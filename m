Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77A60F213
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:19:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ony5F-0003tL-8P; Thu, 27 Oct 2022 04:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ony4g-0008D6-Ca; Thu, 27 Oct 2022 04:17:15 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ony4e-0003vS-Ij; Thu, 27 Oct 2022 04:17:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id o8so622217qvw.5;
 Thu, 27 Oct 2022 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/c/JR5g3/GuczY+ftncW7CC21UEqXD/T3gMa6VxSfak=;
 b=joZ6rcFYRImbIoch6KX3sk+YAY8ZutAg6U6fn/P65Hc7kuSEBjIcjU/8OcllqJKgVK
 EscfanzQGttvPj5ExFgvGw6xtye8dg8GOvW0rMzSuQc2mzPTJeuiETeFpUmCVqNtd9Hd
 6CZ6xT8BwFy78UV8neazP6XztCnane1NHmkkEqQH2HjGruTBg3XUk5r6vSHnxOinjeqz
 nCFiwppr1A6Xy9w4jzfnfmrJnRtsb6SjVGH5dEHP7X/jEqo+JA0mBzhJP+yLLLcjSwn9
 sNfvj7JyU6MpNM+uo9Elb7VOzuhdmAtIc4We51m0WIvw0e8mQf+lRRo7XTp0j5c+GICa
 fDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/c/JR5g3/GuczY+ftncW7CC21UEqXD/T3gMa6VxSfak=;
 b=uZhCJOjxfiMb0phTy0PfZy7na/Bd5UTj3sABmg2xY4uiMS9CTTBRDxULbvGEljLPm0
 AFR4gKdCb7GqB1o+tZV7E+/SPFUKLnnvEnH1VrQcgkfcxbog+wRYdWtBtiEjFFk5rcWn
 JjdK7SL81f2Luxgm4NyVQ7hmGaiKhk+pisTEJDlE3LZQctZS72BQOmtr8WvjLBe/3r19
 nK2lCPnjztsONwgAW0pPWVoGq8P4Z3mAwCMbiXEyJ2EhSxhr36m1VZNssQF0OujX9jzR
 76xnrwbnoakTGuhNC1xGx5vW7RbgpiQbjM6aLL/NfigCzGIEbNwJW3ir7h32rP300ZEu
 pJvw==
X-Gm-Message-State: ACrzQf3GM+sUFqwVsoYyppHMz/T0kNgN5hI+pxnm2L2/NBMX4evCkU9Z
 3GRZKvyRr63+D18YGPb2TgF8Sw/AFFTx5oNKPgc=
X-Google-Smtp-Source: AMsMyM7qC5ElX4zX1FZn4fjHFuYT+zxkZSnsWqaguLfLQq2DWleW/cAEd3DJVtvXCjPySF9EeAKHGd4X7T6pwZgVdKc=
X-Received: by 2002:a0c:e00c:0:b0:4bb:7807:d2ce with SMTP id
 j12-20020a0ce00c000000b004bb7807d2cemr15017047qvk.51.1666858630283; Thu, 27
 Oct 2022 01:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
 <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
 <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
 <CAEUhbmWv3F-5rPnE37XbmdSyfuKAXb7JOwywqVPnzA7dq361Og@mail.gmail.com>
 <CAEUhbmXka0i8Jt_kO_LHNpLWEix17Q7GiMP+U+6kEf4v9M7Rfg@mail.gmail.com>
 <Y1o5Slh7H+scVmYi@redhat.com>
In-Reply-To: <Y1o5Slh7H+scVmYi@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 Oct 2022 16:16:58 +0800
Message-ID: <CAEUhbmWzCFpmwV2dTjrMqO7ieFTZjh6dktY9gdYFytj7k-ZO1A@mail.gmail.com>
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
To: Kevin Wolf <kwolf@redhat.com>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 3:55 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 27.10.2022 um 04:45 hat Bin Meng geschrieben:
> > Hi Kevin,
> > [...]
> > Will you queue this patch via the block tree?
>
> Just to be sure, you mean only patch 5? Yes, I can do that.
>

Yes, only this one. Thank you.

Regards,
Bin

