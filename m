Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A45EFE10
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:36:26 +0200 (CEST)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzKb-0001Bm-GA
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzH3-0007BQ-Am; Thu, 29 Sep 2022 15:32:45 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzH1-0000UR-In; Thu, 29 Sep 2022 15:32:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlwBf-1p4UGb3ewF-00iyqd; Thu, 29 Sep 2022 21:32:31 +0200
Message-ID: <be8beef7-7b80-bacb-3ebf-247f03c55374@vivier.eu>
Date: Thu, 29 Sep 2022 21:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] docs: Update TPM documentation for usage of a TPM 2
Content-Language: fr
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-trivial@nongnu.org,
 marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220927122146.2787854-1-stefanb@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927122146.2787854-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cfL69kB2Iz7MMRk9pqUpufHu3JHZivc1zVgQI/5B1oZmsoxddT9
 A1WDVk03t8FfGlDm4WrNgR4dC2eSiN2/R7yOSvoWC72P9g1lzHtpomu4BnsJVsOJfDcRDSq
 wPItuBibYT1Lh0AefyefLmnDkbqcH+tMXHk4tyznh1PlRpGQlj01v5/lm/VjU/o0m0VEe7J
 oRtYmXVseKva7H1Vg/hwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p4Amm9zq5rw=:3FFBrSaZKmdLXong38W5E4
 dBP0Kxv3b72KlgBZsOHzuM1gqhn7STyLFdMmeTtNrT798O9hzcoxHtlQnQJK3XCghlFDNLBxh
 GJYedq7W7iFuCXKwWT34d/cU3SepzJnRxRE+i1uSEAIWOTRuEOdWU1isqWfNGENb6rOYImSiK
 AzoPF9PkjsGpJbl1qXmBBYBslMFQYmIBkogO8mqznmAwtTFezobIFoi8CTGA5NF75+tL8hbqr
 CGqwKEzQhyOVA+4HoiZsQIAon55JaCLZDbf3tiG1VVzW5/espG9HQwlfetbfEiEMm2XD19+5/
 eZ+P6K4kebgtsw5T9AQhblEVEAxFZ2b0VpOBUOCo/31Aw4CIojelkoCFfWkz1qKCMHTMYxPXc
 Wj1KtLkgoE3eJVtXOiIemz5u3uFNg4Qgwm4DB7krvDQI3ffQafwXaDJy24as+XqR6Ji8Liuz6
 KYfVE2NDUbVDTzAEPnboHAT3uLhHGSvVK8kKCkt63k4R3/Xo4qEstpQa1aCJzjwtds3K/SGpi
 elSmx/j3X8DhgskjA13IVfPmUPC4avwb5t1dL9uFbi3dVh54LHXY6MJZnGimtZ8GI2zaxGwy0
 pAgeJjbOP3Jwmh8JzS3hqo08zuKA9aK2xhNv+ISGE6I8Va1O19PykCMmBzp6HKp7NjrgNEEk5
 B8XfujKXvO1VfeRevRJ2m3xnZoyNV02ppQMuOP5B+CEKUQ0c6KmraliAKFoOfA8iyccBqMpr+
 pfiHJQ/htFjAn1E5LbaNUE1b2Lo3fHoS2G4pV5UYa7C5igLEmokAA7cIERqoQFellVFiVnJMv
 kcqfIi6
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/09/2022 à 14:21, Stefan Berger a écrit :
> Update the TPM documentation for usage of a TPM 2 rather than a TPM 1.2.
> Adjust the command lines and expected outputs inside the VM accordingly.
> Update the command line to start a TPM 2 with swtpm.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   docs/specs/tpm.rst | 44 ++++++++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..535912a92b 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -250,24 +250,25 @@ hardware TPM ``/dev/tpm0``:
>   
>   The following commands should result in similar output inside the VM
>   with a Linux kernel that either has the TPM TIS driver built-in or
> -available as a module:
> +available as a module (assuming a TPM 2 is passed through):
>   
>   .. code-block:: console
>   
>     # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=id 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>   
>     # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>   
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
>     ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>   
>   The QEMU TPM emulator device
>   ----------------------------
> @@ -304,6 +305,7 @@ a socket interface. They do not need to be run as root.
>     mkdir /tmp/mytpm1
>     swtpm socket --tpmstate dir=/tmp/mytpm1 \
>       --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> +    --tpm2 \
>       --log level=20
>   
>   Command line to start QEMU with the TPM emulator device communicating
> @@ -365,19 +367,20 @@ available as a module:
>   .. code-block:: console
>   
>     # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=id 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>   
>     # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>   
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
>     ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>   
>   Migration with the TPM emulator
>   ===============================
> @@ -398,7 +401,8 @@ In a 1st terminal start an instance of a swtpm using the following command:
>     mkdir /tmp/mytpm1
>     swtpm socket --tpmstate dir=/tmp/mytpm1 \
>       --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> -    --log level=20 --tpm2
> +    --tpm2 \
> +    --log level=20
>   
>   In a 2nd terminal start the VM:
>   

Applied to my trivial-patches branch.

Thanks,
Laurent



