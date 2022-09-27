Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF35EC527
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:58:31 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB6U-0001TZ-PP
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od91F-0004Qg-ON
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:44:58 -0400
Received: from mout.gmx.net ([212.227.17.21]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od91D-0005Jx-3q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664279088;
 bh=PyFyrawjUr3o4Ycn4S0wrXnbdSRZ5ibH1nKe6MuES7U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NOAVJ6P9iACRdrpgjvezQ4FBwLfOU8oQLymzS7wshOSaxYl22FmBKPefEeh09j371
 G3Axp4waeQTh7s6G1W3uCCAIsnL6Ct7fbBd2NOQPkenU6f7vDp7etI05WmVAGNmdb0
 Q6Sc4jBGdBxj+QVMwhO8lzb7VrWLgiz/QjEIrtpE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.138.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1oiYwG16l2-00VyGN; Tue, 27
 Sep 2022 13:44:48 +0200
Message-ID: <9981e929-c68b-9e2c-edab-2e97ddefd348@gmx.de>
Date: Tue, 27 Sep 2022 13:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <YzLJlENCtqx87DIs@p100>
 <CAAdtpL5CvS_3aMgYhpc+okqSYA+WLQ=DfW0TvH04rYPXSJ9ggw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAAdtpL5CvS_3aMgYhpc+okqSYA+WLQ=DfW0TvH04rYPXSJ9ggw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t6ofYAbPOp7a5IemMoozEAh0RY2N/e2Z68QTlx5J6z3OplS9bgI
 uink6/UqkjYvICTLMoSxtiFNHb+yrzYX87APc73F9uuG3VvWXDM5Q/BgobAqHHKJbrQyHlt
 iqWn9E74D9tcvd6gtgts5uc62iIgIxa6mJc937KDZrtSaR2XjHhq/VBhpYse6/R8kPJz+rX
 W/IycyPJR1BEgfen0bsRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mFb22pD52WU=:es3Fev8T13xOJm7xYY/+P2
 nwYU9SorLKzOKjNIpTT2M6x6IFqLJM9vtqLI59oPp5UY9Zi9l+3vT8CNXgNEA9aMEQkVz/qOs
 g93Y4QiLwaZmqAKXbm1HkPTRpISLDxBlfAyVY9dwZvqia8OhJrgkQ2hB+umV61gFyYEKYFNAx
 IFccyEgmO9vsU+CABV0tDN1DJ6RD5K27Ix11luk2/RmHqsbJGXoqj6/Wav1gi98ngmlM2g/Yh
 2nCHOXlk5biMNPJ6DSo63ZYbZdAXmK8yjveCDwlGZsEE3anOqsbunbRcoc/9Kd/Dq3fT0xr8q
 W3+WTlOQCz+Api8kNgbmzO68ITHpZan3LqvtROAD6F1Cr/engIBNSkGF603+6i7nOwEl1CtDc
 nmphnBZDRQ8nRTB/PNlD1KZdNWSmoKPEHnWDR7j+TZkIf0Y23ooXoxs9cSGrNTpl1xNbgPOPi
 +7T0bkHQhITFjKAar8mSW7AGX36+LM18OsGz2PpuuXVnItGuQ/Me0LHxVrBTDPsJfZz/x18fR
 6h9PF4m4k3FCOFrkgG6svQxVM75wfObT+TR7bPwYbUPIKpAbcsjG+W8IlUo+0Sndue7PGoyMM
 pqyRxYv9smcjMRuiscn0lzASS6QysSb+phK2tdRLnibt57zE0qKtyNosM0Yk6/N7M1IVabPsz
 v9wz77l51FkIv6UONrD/GPfEL+J/fKg9+r3KVwsZB1lVbdQ0ohI7I9l2Hd/Jvkc8oyErOCDah
 0C9p0yIuZe+h9s6Rh03+tea6D0If0GnxN0Rej3M3pJxzIn92Kw2hgf9ytdMUUMSSsFucT+Vpv
 FEzlnvKKXbh+pmieYzCzbnxNpobIopyBpfNXDUBiUhtIEYDA6ZEfYBYKINDD+S6E+fqC+GJyW
 kHSAzzJUUGdfHeKVERGa6RZi06F62HkudymPBZK6ZVtbWB7occr/6rCXNd6t7ocktG9xY6YY5
 NPfzBFC4MmYO0QXQVreLKwo7uXtt9kw3xJq2L17+6Nz6Sf6W2YN2sRVSANQtfhvAx2u1VLqBQ
 a1H8J3BviVpTUW7MzboUcKWVKPMzPCaYT9VjTilB5topstPFz8kS3PLKjP6qLhAzbo5YDi5sO
 2378QT4htVGa+rbY6+3Fh63O4I59zfgJQYE5K97Sg49fl04kieqFdIylHsn4B/xvfNqg39iQP
 go06HAxx8/v5kn4mycPf9BQXai
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_MSPIKE_ZBI=0.001, SPF_HELO_NONE=0.001,
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

Hi Philippe,

On 9/27/22 13:13, Philippe Mathieu-Daud=C3=A9 wrote:
> On Tue, Sep 27, 2022 at 12:09 PM Helge Deller <deller@gmx.de> wrote:
>>
>> When the emulation stops with a hard exception it's very useful for
>> debugging purposes to dump the current guest memory layout (for an
>> example see /proc/self/maps) beside the CPU registers.
>>
>> The open_self_maps() function provides such a memory dump, but since
>> it's located in the syscall.c file, various changes (add #includes, mak=
e
>> this function externally visible, ...) are needed to be able to call it
>> from the existing EXCP_DUMP() macro.
>>
>> This patch takes another approach by un-macronizing EXCP_DUMP() and tur=
n
>> it into a function located in syscall.c.
>> Beside a reduced code footprint, this approach allows to add the memory
>> dump and simplify the code to print to console and log file.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.=
h
>> index 36ff5b14f2..0b26b56915 100644
>> --- a/linux-user/cpu_loop-common.h
>> +++ b/linux-user/cpu_loop-common.h
>> @@ -23,18 +23,7 @@
>>   #include "exec/log.h"
>>   #include "special-errno.h"
>>
>> -#define EXCP_DUMP(env, fmt, ...)                                      =
  \
>> -do {                                                                  =
  \
>> -    CPUState *cs =3D env_cpu(env);                                    =
    \
>> -    fprintf(stderr, fmt , ## __VA_ARGS__);                            =
  \
>> -    fprintf(stderr, "Failing executable: %s\n", exec_path);           =
  \
>> -    cpu_dump_state(cs, stderr, 0);                                    =
  \
>> -    if (qemu_log_separate()) {                                        =
  \
>> -        qemu_log(fmt, ## __VA_ARGS__);                                =
  \
>> -        qemu_log("Failing executable: %s\n", exec_path);              =
  \
>> -        log_cpu_state(cs, 0);                                         =
  \
>> -    }                                                                 =
  \
>> -} while (0)
>> +void EXCP_DUMP(CPUArchState *env, const char *fmt, int code);
>
> s/EXCP_DUMP/target_cpu_dump_exception/
> Worth split as a preliminary patch updating all targets.

Sure.
The idea was to get feedback first before touching that many files.
If people think this approach is right, I'll send a v2 with the targets
updated accordingly.
Maybe better: s/EXCP_DUMP/target_exception_dump/

>>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *r=
egs);
>>   #endif
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index d17f5d1c66..00861e9351 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -158,6 +158,7 @@
>>   #include "qapi/error.h"
>>   #include "fd-trans.h"
>>   #include "tcg/tcg.h"
>> +#include "cpu_loop-common.h"
>>
>>   #ifndef CLONE_IO
>>   #define CLONE_IO                0x80000000      /* Clone io context *=
/
>> @@ -8177,6 +8178,33 @@ static int is_proc_myself(const char *filename, =
const char *entry)
>>       return 0;
>>   }
>>
>> +static void excp_dump(FILE *logfile, CPUArchState *env,
>> +                      const char *fmt, int code)
>
> s/excp_dump/dump_excp_file/

Ok.
Maybe: s/excp_dump/excp_dump_file/ ?


>> +{
>> +    if (logfile) {
>
> Rather:
>
>      assert(logfile);
>
> (programming error).

I don't think this is a good idea here.
The logfile comes from qemu_log_trylock() which can return 0 and
this is ignored in many other places too.
The application will stop anyway, so aborting - just because we can't
write to the log file - doesn't seem appropriate for me.

>> +        CPUState *cs =3D env_cpu(env);
>> +
>> +        fprintf(logfile, fmt, code);
>> +        fprintf(logfile, "Failing executable: %s\n", exec_path);
>> +        cpu_dump_state(cs, logfile, 0);
>> +        open_self_maps(env, fileno(logfile));
>> +    }
>> +}
>> +
>> +void EXCP_DUMP(CPUArchState *env, const char *fmt, int code)
>
> s/EXCP_DUMP/target_cpu_dump_exception/
>
>> +{
>> +    /* dump to console */
>> +    excp_dump(stderr, env, fmt, code);
>> +
>> +    /* dump to log file */
>> +    if (qemu_log_separate()) {
>> +        FILE *logfile =3D qemu_log_trylock();
>> +
>> +        excp_dump(logfile, env, fmt, code);
>> +        qemu_log_unlock(logfile);
>> +    }
>> +}
>
> Nitpicking a bit, otherwise LGTM.

Thanks!
Helge


