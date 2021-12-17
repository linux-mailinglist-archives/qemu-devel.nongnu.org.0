Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E234787F4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:41:39 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9kA-0000C5-9d
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9ir-0007H5-Lo; Fri, 17 Dec 2021 04:40:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9iq-0006PP-1T; Fri, 17 Dec 2021 04:40:17 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfqGN-1mIkIA10Ez-00gDiL; Fri, 17 Dec 2021 10:40:07 +0100
Message-ID: <401fd0d0-0091-f37d-8288-64c48499235a@vivier.eu>
Date: Fri, 17 Dec 2021 10:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211109144504.1541206-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211109144504.1541206-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ZdMo3W+Dlx7R4VfhU24xoNcnwNF+sR1zo/jd81BKUDSksr7+ob
 rVgteDnLisJpSebAM03KZgWCfGp1eKperQxH1HhEKMxJESs5E8VfnTmHo3s0TSgx23UpaXr
 ANfmMjf9x+judhTdJ0wSwJBn35CGvwR7hKN9+2xawQ+mm362Gy+Q8XNa79kfv3GsZXZFg8r
 rbMo079E6hPD9owQdU2/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DD3hk/PYVGo=:fhLTVh1XCvLmA7Tap6oTZE
 7r774sFJ4NtiTLHJZDmSc1I2QvTf4pAOPaeukYLRgOo6C5xCrKQ0grd4IX0C1DwRV20icmJde
 W7+zZXs2mMOYHuK/azl952+gTZJef4EpCNNhBtmTUVV4+E+w9ahY0pJC2KOoqQCga46EgNGpc
 u6l6tfpbUpRf88ReRpmcRy4qr6zoc01SZtZJ0iFzzBMmXrBwW7rDj7qdnXbNOZzMHf0AK/h05
 DQsD87SMG2E06s6TPRoEsRK8ofQEIegyAtaqtIsC36i5pWkIJN1UiQsvJMtRhbVXsggpeLKub
 qXkfUncoQN34GD0qMhTs8v78eL42aRGqzTTVgJg6/CAl1SJOpQo751yQk519mOOrHLaf4HSsI
 G5NzvlekwNzc1Y2+Y7BmrGuknbWaenSvLgUcEtSECk99hBsGr5W4xLkfhTCZyOWONewa4BSlE
 ncen7HSn1Tj7CNOz25EScYoJBxTPhonL0EsMCQGqZt2EgX247w4DO9HT/SzdwPORAC1Gu2Sra
 LiPFzi3hnvgOS1YWtza7FyiuEjeM+T7pIoLI6Q5YQZd5lP1dzWxbLSBmUMPK58eHDEzKtBYvG
 UGJY9q1ohEJ0ifnSIHQXlAikv6dMikgh1FeLestA+kFgtwywiuelVTGVqYiTkvMjRzHRX3rP9
 LurREEnGJWMJ4L7NAgPq2f+K4geh8lRIWQuYGXJjL0xCTFjju96DFr3R1Daa7VsObtmU=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/11/2021 à 15:45, Philippe Mathieu-Daudé a écrit :
> When using the MinGW toolchain, we use the .exe suffix for the
> executable name. We also need to use it for the symlinks in the
> build directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 48c21775f3a..31e8f586dc7 100755
> --- a/configure
> +++ b/configure
> @@ -3786,7 +3786,7 @@ fi
>   
>   for target in $target_list; do
>       target_dir="$target"
> -    target_name=$(echo $target | cut -d '-' -f 1)
> +    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
>       mkdir -p $target_dir
>       case $target in
>           *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

