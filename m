Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FF2D8E73
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:57:48 +0100 (CET)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTko-0005Fc-Vv
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koThw-0003DM-RG; Sun, 13 Dec 2020 10:54:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:44421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koThu-0004i9-Kd; Sun, 13 Dec 2020 10:54:48 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQvH5-1kRA4D2ZFv-00Nyjm; Sun, 13 Dec 2020 16:54:42 +0100
Subject: Re: [PATCH] qemu-options.hx: Fix minor issues in icount documentation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201121213506.15599-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3e67df2b-6abc-1289-f8f1-704361c9e294@vivier.eu>
Date: Sun, 13 Dec 2020 16:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201121213506.15599-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MQsogxncCEf1QN7WMIwgHhqZujG3zDC5ZvQV/JDNtsl/SdLRRk7
 VDRKHxV1SwyohEMykDba5j5L5YK59D5dfzyaZ1xyF+h4gITC9dwW7OFFxvKVLIoP+vaP44h
 owU18SXN+vZSbKyumygZDYo4NN2AhljI6LX88VAH/BrArJ2Vt8oNpBmHapx80w0qKUueXWQ
 6/8Kd87oSpOymYmQbvWsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W6W0bRHNXqU=:gA8OqVqF/tifEpRUW+Y+IL
 winBi5aWoSmSGhydMYh7Ea115qmUr53YApU5Da8UKpq4cahnv1VmHiDJ4E4MoMi4YR1ciVuMz
 c4CjOHCKVMK8Q1HF47RRLHkaQrStDPruwKjHifGWDVq88Me02r+XnCmZUcS94tv0PgUQHjbKu
 8JXUS36/gkvZng8LQvcWWS2EG186zCMx9bnboCRucFp890Rja14eiqQ6cjgN0jEIWcGw9ikB5
 QdiaLz4tXKDElVkqliLTRnUmjS/K9Q0ISjEjbOZqRkRXhMfVzYmdFXN5TsCZ72ZgXYylNjaYA
 REMWhzPF2W/nEShUKVai/eU4oNOasmBBEHbu88JaOXdqvC7c7bdXNOYRVV7NXJWG9shHco0Yp
 cubm9R6mkVmztgpWGZXWrid7MLARF5eZZmWS9uUhPUWyhxoIbQsvmo0+5Um1C18szXkywZrWm
 zcf+NJ3X+w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 21/11/2020 à 22:35, Peter Maydell a écrit :
> The documentation for the icount documentation has some minor issues:
>  * in a couple of places it says "sleep=on|off" when in the context of the
>    sentence it means specifically "sleep=on"
>  * the synopsis line for the documentation has drifted out of sync
>    with the synopsis line in the DEF() macro (used for "-help" output)
>  * the synopsis line in the DEF() macro is missing a "][" between
>    the sleep= part and the rr= part
>  * the synopsis line doesn't indicate that rrsnapshot is an optional
>    part of the rr=mode,rrfile=filename subgrouping
>  * we don't document that sleep=on can't be used with shift=auto
>    or align=on
>  * the rr option description had some minor grammar and formatting
>    errors and was a bit terse
>  * in commit f1f4b57e88ff in 2015 the documentation of the sleep=
>    suboption got added between the two paragraphs defining general
>    behaviour of the icount option. This meant that the second
>    paragraph talking about the behaviour of "this option" reads as
>    if it's talking about sleep=on, when it's really describing -icount
>    as a whole. The paragraph is better moved back up to above the
>    sleep= section.
>  * the summary text displayed in "-help" output didn't mention
>    the record-and-replay part
> 
> Fix these errors.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1774412
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-options.hx | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2c83390504d..41cb42e7a5d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3956,30 +3956,34 @@ SRST
>  ERST
>  
>  DEF("icount", HAS_ARG, QEMU_OPTION_icount, \
> -    "-icount [shift=N|auto][,align=on|off][,sleep=on|off,rr=record|replay,rrfile=<filename>,rrsnapshot=<snapshot>]\n" \
> +    "-icount [shift=N|auto][,align=on|off][,sleep=on|off][,rr=record|replay,rrfile=<filename>[,rrsnapshot=<snapshot>]]\n" \
>      "                enable virtual instruction counter with 2^N clock ticks per\n" \
>      "                instruction, enable aligning the host and virtual clocks\n" \
> -    "                or disable real time cpu sleeping\n", QEMU_ARCH_ALL)
> +    "                or disable real time cpu sleeping, and optionally enable\n" \
> +    "                record-and-replay mode\n", QEMU_ARCH_ALL)
>  SRST
> -``-icount [shift=N|auto][,rr=record|replay,rrfile=filename,rrsnapshot=snapshot]``
> +``-icount [shift=N|auto][,align=on|off][,sleep=on|off][,rr=record|replay,rrfile=filename[,rrsnapshot=snapshot]]``
>      Enable virtual instruction counter. The virtual cpu will execute one
>      instruction every 2^N ns of virtual time. If ``auto`` is specified
>      then the virtual cpu speed will be automatically adjusted to keep
>      virtual time within a few seconds of real time.
>  
> -    When the virtual cpu is sleeping, the virtual time will advance at
> -    default speed unless ``sleep=on|off`` is specified. With
> -    ``sleep=on|off``, the virtual time will jump to the next timer
> -    deadline instantly whenever the virtual cpu goes to sleep mode and
> -    will not advance if no timer is enabled. This behavior give
> -    deterministic execution times from the guest point of view.
> -
>      Note that while this option can give deterministic behavior, it does
>      not provide cycle accurate emulation. Modern CPUs contain
>      superscalar out of order cores with complex cache hierarchies. The
>      number of instructions executed often has little or no correlation
>      with actual performance.
>  
> +    When the virtual cpu is sleeping, the virtual time will advance at
> +    default speed unless ``sleep=on`` is specified. With
> +    ``sleep=on``, the virtual time will jump to the next timer
> +    deadline instantly whenever the virtual cpu goes to sleep mode and
> +    will not advance if no timer is enabled. This behavior gives
> +    deterministic execution times from the guest point of view.
> +    The default if icount is enabled is ``sleep=off``.
> +    ``sleep=on`` cannot be used together with either ``shift=auto``
> +    or ``align=on``.
> +
>      ``align=on`` will activate the delay algorithm which will try to
>      synchronise the host clock and the virtual clock. The goal is to
>      have a guest running at the real frequency imposed by the shift
> @@ -3989,15 +3993,17 @@ SRST
>      ``shift`` is ``auto``. Note: The sync algorithm will work for those
>      shift values for which the guest clock runs ahead of the host clock.
>      Typically this happens when the shift value is high (how high
> -    depends on the host machine).
> +    depends on the host machine). The default if icount is enabled
> +    is ``align=off``.
>  
> -    When ``rr`` option is specified deterministic record/replay is
> -    enabled. Replay log is written into filename file in record mode and
> -    read from this file in replay mode.
> -
> -    Option rrsnapshot is used to create new vm snapshot named snapshot
> -    at the start of execution recording. In replay mode this option is
> -    used to load the initial VM state.
> +    When the ``rr`` option is specified deterministic record/replay is
> +    enabled. The ``rrfile=`` option must also be provided to
> +    specify the path to the replay log. In record mode data is written
> +    to this file, and in replay mode it is read back.
> +    If the ``rrsnapshot`` option is given then it specifies a VM snapshot
> +    name. In record mode, a new VM snapshot with the given name is created
> +    at the start of execution recording. In replay mode this option
> +    specifies the snapshot name used to load the initial VM state.
>  ERST
>  
>  DEF("watchdog", HAS_ARG, QEMU_OPTION_watchdog, \
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


