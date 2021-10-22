Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFF437ABD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:16:44 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdxDo-0004yE-0X
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdx81-00077Q-L9
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:10:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdx7z-0000R7-3M
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:10:45 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2mWA-1mppAJ2V24-013818; Fri, 22 Oct 2021 18:10:39 +0200
Message-ID: <09f31162-b019-d4b0-c7db-8904b5879a9b@vivier.eu>
Date: Fri, 22 Oct 2021 18:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: fr
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211022111007.43478-1-yaroshchuk2000@gmail.com>
 <4cc0d115-d022-980c-e67e-3eda149e3fdc@vivier.eu>
 <CADO9X9StQyOU+9PH-g78k02L+XeT9rmF+KdoSVszfdaCgq_foA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CADO9X9StQyOU+9PH-g78k02L+XeT9rmF+KdoSVszfdaCgq_foA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OLGQd/s1394vjz956yD/E1cKx/b8Omr+uUEyQg4WCQIUv7/x5j/
 gThrC4iyqanXTl5q6LC3c+iOIHhfxqW7HPGW86Vl+NjGq0KvnnwUhKtBnp8jGWbMR07IUNT
 Qw/Y9f72pSJnBTctqQjJkJUnHL1MNXvfZJxOI/7vR84UeQhiRjbezu4d0BSTD0dd9nLp/Fp
 b7HF+M5mKcNwk62J8uHrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JWNJ1lywOTM=:bptmwDl/69Eo+RPvX9ko03
 JtR+jN8E+7rj/HBFhgwcQD0ivWx7fryWfx4Lyn6fFU0BxH8AaTO3owPz2XMCZCnrmBCtc5XJn
 PX6GSh4pBbD+9Lli7/zYj9Ea4svfPDmBuy18F+7ZndrqYCsIwI9EMnuscdQKiBBa2ljPxXa7w
 r8R64qKVeXnj7KN1ZLIRA5vVARd+fyazn2jPa3MtqobLj7mKtAStwOj/b1pzFIDGEWgk7O0KU
 e38Ey6iUYVczaN92Hvo6h1HouA/+fd/xj2y8cezk7AkuppGdKUOJs/kxGg7UHMW3PNZO1HqUX
 JZa0yYRMbJdKGK6tDspBs2iYpOMk1ARr4v6oM3883/9crUi5lXfWlT6S9yN1q3D5zj/N/rL4R
 BP32xWpyTtro6DQ1989WeStAHih/3uRbiiYBGtkDeU1LAnzhDE0J0ee0+yUgLIG8zHbOWMnah
 17XtuPAu1DdWKGYdY7bP/frZJkaeOEytgH1aMHwJbHsOzuS8sGM9bY+RKk7ja+R2jZT7byfVM
 jEmz2NtQW/gMKVrkWCtkfTsvcwJC5qUOBobmCySzWBErKpqXDyZiyA5AfGLJvlyw/BCfdvFvX
 VMc8VYzBpmozDxOIkWlrAImXd7Gb4U4D3M2x5JzCwR+yEfU1LgWviD51V2AFfuFnJtTVUd32X
 0LwifvovaboiKUfmo0wYkkY2QStWZs8Mfs6OcRH0hM5idFw3X9ahfVYhzR5gBgcwCufE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.742,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 22/10/2021 à 18:07, Vladislav Yaroshchuk a écrit :
> Hi, Laurent!
> Thank you for your review!
> 
> пт, 22 окт. 2021 г. в 14:36, Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>>:
> 
...
>      > +        && !applesmc_read_host_osk(&host_osk)) {
>      > +        if (s->osk) {
>      > +            warn_report("provided isa-applesmc.osk "
>      > +                        "is overwritten with host OSK");
>      > +            g_free(s->osk);
>      > +        }
>      > +        s->osk = host_osk;
>      > +    }
>      > +
>      >       if (!s->osk || (strlen(s->osk) != 64)) {
>      >           warn_report("Using AppleSMC with invalid key");
> 
>      >           s->osk = default_osk;
> 
> [0] The behavior of `osk` property handle: when the wrong OSK is provided
> (or not provided at all) isa-applesmc uses `default_osk` and continues to work fine.
> Only a warning is printed.
> Seems it's better to meet this "rule": when we can't read OSK from host-SMC just
> warn the user and continue with `default_osk`.

Ok, it sounds reasonable.

Thanks,
Laurent

