Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39B616BD1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIGQ-0007Lr-V7; Wed, 02 Nov 2022 14:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIGI-0007JG-Su; Wed, 02 Nov 2022 14:14:52 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIGG-000551-G5; Wed, 02 Nov 2022 14:14:50 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mnac7-1pHtiV2JQT-00jXUa; Wed, 02 Nov 2022 19:14:39 +0100
Message-ID: <35fe81de-09f1-ff7f-e5e5-c738ab838d08@vivier.eu>
Date: Wed, 2 Nov 2022 19:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/2] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Content-Language: fr
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <cover.1667242033.git.brchuckz@aol.com>
 <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YmNRBUh1eQf7TTKBM/iVtRO1kaUeOTeXBvFAcaihbFsSqA9ZvA1
 kK3Vnmn7mBQtNiaimRCViGQuGDgoXoPI727JQYVauMWJvaMri+Jq37KQW72Ru/oJemiGfR+
 qU1VuKqxEbp5wa7xSWf6h3HT6bNJ9vxsHnt9oUm+3X1nBtFtbDPS61DSdRjFmA0PJW/8lPU
 O+F8V+ZvH3xa2mHlnq9Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AZBiDhr4XXE=:TKhATEVUhaRnQCgM2sVFYM
 vwhUc2qw4CuFCXsTGsh/SNl25uX6dQmhDFBuw4/t0gx0nGK5vYkQUviabh27PN92q/TLCk4qv
 Iu+51zTKB84PPMTmE6cz2hVNI70yvz07u+MYkKzCfRYD3McikYH2EsEtTmZFoYO7fReF0HQxz
 v7XAWUVuym8vFi2ZlnSM0cz938gjQ2+a2UNQ2fbsgXfzimcVCV1GtvE1XksZM7Ak9tMyNbFyV
 bxRqSi6LfvunZqhznEfQEqT2bOoqvckx3FOgI2YqsECjENPmtDMeDC0ivCuZPEztHIIBoJscP
 xBwaN/yd42e93AtqTA3+oQvQD//eTF5rD2Rzkurrej26fLK0XTuRYhSgm8VIkBi6c9lZGo++c
 ziTdV/sY/lVnIdzYaOSGnPMWVOeckJAs//Ap0zByaZlKdwlxG5FJO3LF4Bcyi2SSZfXnhhaAa
 j0HGBSbIuYz+IXjrGNwb1xhRytfuxgLknMhvksc0aK9f7+2SrN8D1y/ojM/WplaIzB29j0myb
 /w3beaOFheauZ+MLJTj102mij5hRycMYV//tZ8jNdbpwqfh8QrfnwTMXuygmG+N4rMU+fkTc+
 zkXV/vmqYK9lYy0iK+t7cLj1KwjDtgUJz/iOhk1/NU6HeJswR1w/SeRBqB6TTam4vxkYmdY36
 BAaejozhRoKu0DLhK/QK4wFk1wxKMmppXsSu4BPU49NQ+EpexilqujTPogBn/x6ovGFs1pLu9
 ylHO3nSl+yTgOR7CP4zkBpS4cRxE90q2mv3r+A7dmyBMmqlSDiFkG22RXcGovwraQlchl+4f3
 MTxOYLl
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 31/10/2022 à 22:35, Chuck Zmudzinski a écrit :
> When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
> and the target os is linux, the build fails with:
> 
> meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.
> 
> Fixes: 582ea95f5f93 ("meson: convert hw/xen")
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: No change to this patch since v2
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>      email address to match the address used by the same author in commits
>      be9c61da and c0e86b76
> 
>   hw/xen/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index 08dc1f6857..ae0ace3046 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -18,7 +18,7 @@ if have_xen_pci_passthrough
>       'xen_pt_msi.c',
>     ))
>   else
> -  xen_specific_ss.add('xen_pt_stub.c')
> +  xen_specific_ss.add(files('xen_pt_stub.c'))
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)

Applied to my trivial-patches branch.

Thanks,
Laurent


