Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C048C71F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:22:03 +0100 (CET)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fRq-0002cn-IS
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7err-0004JL-6k; Wed, 12 Jan 2022 09:44:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:38887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7erp-0002w2-Ka; Wed, 12 Jan 2022 09:44:50 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOm9H-1mi1tq22QR-00QCM6; Wed, 12 Jan 2022 15:44:37 +0100
Message-ID: <4f99783d-5ed4-f798-bd04-7906161adb40@vivier.eu>
Date: Wed, 12 Jan 2022 15:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests: Fix typo in check-help output
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111175528.22294-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220111175528.22294-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0sHglb3v4mt0STluwAhT9/oHnSYMixgylRpu9SyKqXnSEd/lAre
 ZkV16Sjxph3O6Ki2q6axAaaujWYz3fFW8LoXAZmpnApPUqnpno55qydg+J6uFOrKuhusLLH
 UBFH6zqgcf6aIqkNrTByHZr4hTL5w3/UNTcbUe0AInTnmSUgX5dRq2epoeGjDN7nMT6HeAH
 AV4Rmn+fLVqe4rnu2nAgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pIlkVx3l5oI=:tipSs9kTht7PZiwJ6Ojx+Q
 c31ymUOd2AMmfunvRXAQnIJ9T4HFHoRGvFd4q+WqFDc6rs74l/bO3St5b2xgl4ct5n2u82fkY
 Sdv9INx0LzWFHZ3JdvaCCt4ZlplTsmKUK4weCek/sMNVbUK/DrYow1CDyfmxPfFwFigz67y6y
 Ve5ts+9JPBemRiJG2WwN39xFrwa+jJ+TBi/GxNBhum94IRpXUefDyTB1Rx86h7J9HCuWz4Pg/
 040Zu+Z2hAxYjrFDd2goeWuzYG0EmVmxIDvXrmHAmzay1bwk1TBJEDF3aGax19x2rfi40awvE
 KOqumQFKZbjDSixSRMr35BDuTUZYekdr6UkbFWLq6X3w0stUeFUH0K4yN1QhTRC13s3/g8Z5G
 ssVyrjC840wRDIIjXtfPzw/upsgiG0VTe/L6no7rDPF0ZfEtGJoRwacIbDlZ/tetVQhx9Kooj
 Crmo1KNYChb0DSupfRzECIPpTQIbma5nCNAAADj7AoH3B4IwVdGCdgyxr53S7pnUOwsTo+7mY
 ks9IMVYr83oXNqsogDyzXwtoUI6uTSzbpvafoX+semYTuseTBLGEl7ihSTy2uam29SlibSO26
 NeY0F8402CeNTGDh1b4GOXwJsd47qDlKyPSX0SYKt2DRrn0BGgtYWWH5PfBC0u6BILVmFPSGe
 i0QZBi4+jg2y9hBywVWXJQwPHa+fS3SL0ddGjnPAhAAvxdrPx8ao5oWgFXPW4bzWiGy4=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/01/2022 à 18:55, Philippe Mathieu-Daudé a écrit :
> Fix typo in 'make check-help' output.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 4c564cf7899..3aba6224009 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -23,7 +23,7 @@ endif
>   	@echo " $(MAKE) check-clean          Clean the tests and related data"
>   	@echo
>   	@echo "The following are useful for CI builds"
> -	@echo " $(MAKE) check-build          Build most test binaris"
> +	@echo " $(MAKE) check-build          Build most test binaries"
>   	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
>   	@echo
>   	@echo


Applied to my trivial-patches branch.

Thanks,
Laurent

