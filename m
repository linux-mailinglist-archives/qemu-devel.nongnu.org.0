Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BB4CD6B6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:47:13 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9D6-0006fj-71
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nQ8mJ-0002KZ-5H; Fri, 04 Mar 2022 09:19:32 -0500
Received: from [187.72.171.209] (port=12136 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nQ8mF-0007zF-IB; Fri, 04 Mar 2022 09:19:30 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 11:18:12 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 31CC18001C2;
 Fri,  4 Mar 2022 11:18:12 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------JRqF8xnDsBnnuuI5ukTx21Gy"
Message-ID: <0cf4d2bb-0559-854b-8051-3c391988bc8b@eldorado.org.br>
Date: Fri, 4 Mar 2022 11:18:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Issue with qemu-system-ppc running OSX guests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Fabiano Rosas <farosas@linux.ibm.com>
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
 <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
 <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
 <87pmn352q0.fsf@linux.ibm.com>
 <a3917a31-b899-a289-5102-5b8be20aae27@eldorado.org.br>
 <7c7b2adb-67e1-26b8-03a3-74f70dc9bc80@kaod.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <7c7b2adb-67e1-26b8-03a3-74f70dc9bc80@kaod.org>
X-OriginalArrivalTime: 04 Mar 2022 14:18:12.0646 (UTC)
 FILETIME=[AE9AFC60:01D82FD2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------JRqF8xnDsBnnuuI5ukTx21Gy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04/03/2022 11:07, Cédric Le Goater wrote:
>
> On 3/4/22 12:08, Lucas Mateus Martins Araujo e Castro wrote:
>>
>> On 02/03/2022 20:55, Fabiano Rosas wrote:
>>> Howard Spoelstra<hsp.cat7@gmail.com>  writes:
>>>
>>>> On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan<balaton@eik.bme.hu>  
>>>> wrote:
>>>>
>>>>> On Wed, 2 Mar 2022, Howard Spoelstra wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> I noticed qemu-system-ppc running OSX guests does not get to the 
>>>>>> desktop
>>>>> or
>>>>>> does not display the menu bars.
>>>>> Cc-ing the relevant people and the PPC list might help, I've added 
>>>>> them.
>>>>> Also telling which OSX guest version can reproduce the problem 
>>>>> could help
>>>>> debugging. Is it any OSX version?
>>>>>
>>>>> Regards,
>>>>> BALATON Zoltan
>>>>>
>>>> Oops, Qemu running on Fedora 35 host,
>>>> Reproducer:
>>>>
>>>> ./qemu-system-ppc \
>>>> -M mac99 \
>>>> -m 512 \
>>>> -L pc-bios \
>>>> -display sdl -serial stdio \
>>>> -boot c \
>>>> -drive file=10.1.img,format=raw,media=disk
>>>>
>>>> The issue affects all supported Mac OSX guests: 10.0 to 10.5
>>> Hi Howard,
>>>
>>> Thanks for bisecting this. It seems we inadvertently marked some of the
>>> Vector Multiply instructions to be ISA v2.07 only.
>>>
>>> I can boot Mac OSX 10.4 until the desktop with this fix:
>>>
>>> diff --git a/target/ppc/translate/vmx-impl.c.inc 
>>> b/target/ppc/translate/vmx-impl.c.inc
>>> index f91bee839d..c5d02d13fe 100644
>>> --- a/target/ppc/translate/vmx-impl.c.inc
>>> +++ b/target/ppc/translate/vmx-impl.c.inc
>>> @@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, 
>>> arg_VX *a)
>>>       return true;
>>>   }
>>>
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
>>> +TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)
>>> +TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
>>> +TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
>>> +TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
>>> +TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)
>>> +TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
>>> +TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
>>> +TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
>>>   TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
>>>   TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
>>>   TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
>>> ---
>>>
>>> I'll let Lucas comment on it and we can send a proper patch in the
>>> morning.
>>
>> Checking here it seems I misread the PowerISA appendix and marked 
>> these instructions (vmul[eo].[bh]) as v2.07 even though they are v2.03.
>>
>> This patch seems to correct it and checking here the newer 
>> instructions are correct (v2.07 for vmul[eo].w and v3.1 for 
>> vmul[eo].d), so
>>
>> Reviewed-by: Lucas Mateus Castro<lucas.araujo@eldorado.org.br>
>
>
> Could you please send a proper patch ? The above was given as an example.
>
> Thanks,
>
> C.
>
Yes, this will be added as a proper patch to the fix up patches Matheus 
will send later.

-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------JRqF8xnDsBnnuuI5ukTx21Gy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04/03/2022 11:07, Cédric Le Goater
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7c7b2adb-67e1-26b8-03a3-74f70dc9bc80@kaod.org">
      <br>
      On 3/4/22 12:08, Lucas Mateus Martins Araujo e Castro wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 02/03/2022 20:55, Fabiano Rosas wrote:
        <br>
        <blockquote type="cite">Howard
          Spoelstra<a class="moz-txt-link-rfc2396E" href="mailto:hsp.cat7@gmail.com">&lt;hsp.cat7@gmail.com&gt;</a>  writes:
          <br>
          <br>
          <blockquote type="cite">On Wed, Mar 2, 2022 at 9:11 PM BALATON
            Zoltan<a class="moz-txt-link-rfc2396E" href="mailto:balaton@eik.bme.hu">&lt;balaton@eik.bme.hu&gt;</a>  wrote:
            <br>
            <br>
            <blockquote type="cite">On Wed, 2 Mar 2022, Howard Spoelstra
              wrote:
              <br>
              <blockquote type="cite">Hi all,
                <br>
                <br>
                I noticed qemu-system-ppc running OSX guests does not
                get to the desktop
                <br>
              </blockquote>
              or
              <br>
              <blockquote type="cite">does not display the menu bars.
                <br>
              </blockquote>
              Cc-ing the relevant people and the PPC list might help,
              I've added them.
              <br>
              Also telling which OSX guest version can reproduce the
              problem could help
              <br>
              debugging. Is it any OSX version?
              <br>
              <br>
              Regards,
              <br>
              BALATON Zoltan
              <br>
              <br>
            </blockquote>
            Oops, Qemu running on Fedora 35 host,
            <br>
            Reproducer:
            <br>
            <br>
            ./qemu-system-ppc \
            <br>
            -M mac99 \
            <br>
            -m 512 \
            <br>
            -L pc-bios \
            <br>
            -display sdl -serial stdio \
            <br>
            -boot c \
            <br>
            -drive file=10.1.img,format=raw,media=disk
            <br>
            <br>
            The issue affects all supported Mac OSX guests: 10.0 to 10.5
            <br>
          </blockquote>
          Hi Howard,
          <br>
          <br>
          Thanks for bisecting this. It seems we inadvertently marked
          some of the
          <br>
          Vector Multiply instructions to be ISA v2.07 only.
          <br>
          <br>
          I can boot Mac OSX 10.4 until the desktop with this fix:
          <br>
          <br>
          diff --git a/target/ppc/translate/vmx-impl.c.inc
          b/target/ppc/translate/vmx-impl.c.inc
          <br>
          index f91bee839d..c5d02d13fe 100644
          <br>
          --- a/target/ppc/translate/vmx-impl.c.inc
          <br>
          +++ b/target/ppc/translate/vmx-impl.c.inc
          <br>
          @@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext
          *ctx, arg_VX *a)
          <br>
                return true;
          <br>
            }
          <br>
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper,
          gen_helper_VMULESB)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper,
          gen_helper_VMULOSB)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper,
          gen_helper_VMULEUB)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper,
          gen_helper_VMULOUB)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper,
          gen_helper_VMULESH)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper,
          gen_helper_VMULOSH)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper,
          gen_helper_VMULEUH)
          <br>
          -TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper,
          gen_helper_VMULOUH)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper,
          gen_helper_VMULESB)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper,
          gen_helper_VMULOSB)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper,
          gen_helper_VMULEUB)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper,
          gen_helper_VMULOUB)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper,
          gen_helper_VMULESH)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper,
          gen_helper_VMULOSH)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper,
          gen_helper_VMULEUH)
          <br>
          +TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper,
          gen_helper_VMULOUH)
          <br>
            TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper,
          gen_helper_VMULESW)
          <br>
            TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper,
          gen_helper_VMULOSW)
          <br>
            TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper,
          gen_helper_VMULEUW)
          <br>
          ---
          <br>
          <br>
          I'll let Lucas comment on it and we can send a proper patch in
          the
          <br>
          morning.
          <br>
        </blockquote>
        <br>
        Checking here it seems I misread the PowerISA appendix and
        marked these instructions (vmul[eo].[bh]) as v2.07 even though
        they are v2.03.
        <br>
        <br>
        This patch seems to correct it and checking here the newer
        instructions are correct (v2.07 for vmul[eo].w and v3.1 for
        vmul[eo].d), so
        <br>
        <br>
        Reviewed-by: Lucas Mateus
        Castro<a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
        <br>
      </blockquote>
      <br>
      <br>
      Could you please send a proper patch ? The above was given as an
      example.
      <br>
      <br>
      Thanks,
      <br>
      <br>
      C.
      <br>
      <br>
    </blockquote>
    <p>Yes, this will be added as a proper patch to the fix up patches
      Matheus will send later. <br>
    </p>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------JRqF8xnDsBnnuuI5ukTx21Gy--

