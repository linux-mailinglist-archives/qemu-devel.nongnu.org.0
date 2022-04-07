Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A74F7E14
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 13:31:09 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncQM0-0005LB-12
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 07:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.frederic@yahoo.fr>)
 id 1ncQJO-000427-Tl
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 07:28:28 -0400
Received: from sonic301-21.consmr.mail.ir2.yahoo.com ([77.238.176.98]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad.frederic@yahoo.fr>)
 id 1ncQJL-00049X-T8
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 07:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1649330897; bh=iM1EQc5x3Q7o+iWivx3jSRaSMIIFm89NRwL15/cfMtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=q+iEkU7iWTjJNNFZiTOVSwhbeWdMRRROh7grKWHI3dfL7wbLj/H9Uv+87VyP8GPHAuyey5TexrxQAwSPCV9vYNTzWkM179e7pvZxtF67tpr/DDlsaQBSVDcERMmE0XyGj0q0D2n7tXQ/lDxEWmYPjU0RQZCTARbwJWqZLCJzRZv3KD9/0LBriGN+kHrdPUBjX7qtQnrGeVebiqOml6+wjBG+B00EDW16aEXIzY/wAPGoGZ7TzA/2X8NnVJQnmn82mv9pft2W08P0bou+DP9mkeI1PJY+xAq//sbZIt3zSYxm7uBSdXOs59Q8qd8Z73edLpl3mn5e6dyDLm+FmS86Ag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1649330897; bh=dSWNoUEYxky31PU6Cn1Ol4VHwCyxH/ax6f/RgLJrw7e=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=oCeLaItpvMgu7B8ttZDtauCFRixQiRGQ1emU4NZZvPZnevN2DA1tUEJvGNkcBiziXLJQ5AUKH5+YdaCZV8RqQ7sGGjD1m2xe5qnYOq7hVVxxVDwN2/qP/j1FREXOdAG7txMjygZH18DHjFLaEqvwU0BJnpVRMnpKw19IWf7Rszq1uKamfZSIyVIFkUHacgWtXSkWGjFhmIRCC4eqZFR9NlnLLRA3cZsgN6g4b8BsgsNGdnt/zIDHujbUj09tzkvA6btTSluEaFi+AHwDTNZgWM2QL4ytrxo3PIFM7HkWp5ipBisWhMUztBclY4Tul2mZ/Zp7EHX5MXgXOOh7OLoViw==
X-YMail-OSG: 2pFBDmwVM1k9W0G94O8sPuaIsPu6snqQ9Y_bJIZ8PRjsPPdkK8lD2etQWCmlo2D
 HepvAIT1QwI1XIQZ3qdkAgSUXbVFWvbpEeA7mmwQbyQLM4iQ_LaDrHXplKrtwvlcKJcsXDvaKbat
 xK73urEFFqIStjHIplZukKqitvcMkZo9tvbHnOJMXChzLirmBso9NdLcCWI1HzEnZ9q9ThTd1K1C
 fJxRdeUKmOo3PewYK1.Q0wNHziD5jXB9NzrJYCHKKxKTEp_gMb_z66mkmRLgTu9sb1mAEObyd.0D
 GRayi_tz8ClSBPGJzH5dUbCWSVLYVbsXekh_cyV1cnwxYunCRqccmFQ1N8DUcm1M95nZyu11Kz1m
 n_s_YXwvlJXpRv0MAaBTZASgb26gOjmHb1VQGW4BqSXr3IqodeqdxWFBYpZOfl_0iPW0whxxUj7b
 GkBBXlqg63CmyCRE4rhVY8131zHSXuX5fvIqyTYScxfDh3VxdoO4.6ZDXG5nYpZhlnQb6E7jtJaO
 sr1bwzfB_rsVxzixMI3H6n6P3P04pQaHqOPaUo.B0hR3OkBudhdXabZYTH9g2VxK0yMr5Yu5VuRv
 VxnBdW9EMdDoJIEeja9siZ2M2fLTpJ.N7BRWzNsWucogTpnNS6YfnHGiDo1_dLQ8XghkDHOnwF1k
 060VOe6iopcmm8M_9QMoxJsiSfqFOtPg_uky93NHol6UWFea.dqzQhOj9y3iQl4JQBbVWuokwEWx
 dC0W3bif6OUN5rdnd6YUh3ZS93b0uR0BvjvOGlQMAaY2EB.JzmcvUIEO88PlaEKLzYEgXMM11W3X
 _2QbVOzW2UHoPHdMasboqisottHljnRFMCs2Fn_KlD0xVIUNcbQY6mb678XKPg9wxa5TGNMq3G16
 QEtfkzpZLNdMiXsHQBS0JroO8F5co99xSk.UcBNa9dlrqvb.c3rfvbRJ_wZFxr0N5Ye3cmUhj3TZ
 gtpOaaI1d8ZjkWz5ByE4cIaUxRo33dUfQabXxGmx3YH82srIrCNY2IYr1Zo.ZUFbR7vGDBVoWtG9
 cGD9MOTXP.IbiEdRti_QbUhSkhGdlSY5su0kt90XbxoK_BmnD79GMuWFhk1mP22iH4HC7bZh0tNo
 B6csUF8ksCUldSOWPDnkK2uTM4NMLDNEDbvWNa2kKSy5L4TX97iq2N1zML1t1U_cnR9pJ4djKRID
 mVDmmqGMmI_vg2dghHiCtRUm2jHG84D5tOCNh2qy__6aNWLNs1sNw1WoBzzbsqNUt2oZzF687ITF
 tRxPSsxaQeAJnQUMdmpHouP4Zhx66wyoVY_avaRWk0TNC4i_aSj43Ly3B_A94H1K.v2BbwrMAuak
 f7YJpROT0hhce0adMZBmw6swgtDSIHxC1s5zBw3TDdUfmiyp0UXBIFtlbvnDi4U48tZ5z1HL5YE4
 mGh0.94vppe98tov4JfKgxi3DZGmJZoyw9Ip91d.suqvU459._0bMsWPiXv8QIdIq8Crf6ZoAWag
 AGtJjG4keVmfK1rcxyUO50Po4qh0.XdPYBxoyrZjH_O2XRpfduHiAqjsKm16yx0P.NK4iYNkEm1E
 2MAVlONh6aSzZkG8g_oMDbpz3_serKk4_yDE64MdXmbIR5IFmJmiM6W_HbhS25CS2YQ58ynVFkUg
 fSnTkmiTOBbQAUQeVMA9FgDknUlDRyDTa6mSylkuJxPAEXE6j9PY6AMYyNYw_cY5g97jQOg.evAA
 8Z8WJ7tdGvckJ67.neM_0JSIJabatfcqn8DLpjNVzxpRE6iXc.bcAk9T2vk3NshLWzkopTyHfQdO
 XlNEfj78RVcOVwod5_BA1MpFDPy0jBCUR8z2xTno2pncMFO.InSKs6JyDm22FlspRT9lM8rWYXOC
 mO.ZTFrFDzP4.QFphef_7V0vqjqIqA3qf1ft5Z8SrTUIWfXQwPjlGpbNLqjgeG8lm6YHfnKRMskE
 dd3ggtXiCr2k6sUtc1OXWj1MvOGkTQ06JqPHuTyJ1zo8TL9l6bn9_2gsoVfPwBdGp3pm2OWjIqvf
 UEeSWBPyKniB806ckJMxQjwoy2f8c5.8SdmG9NcSxJBhfCNN2dtQX3QYa9f_HNNbdKgugtQsAOog
 O4H3Kn6Ukwq37rnZ4B.tuyA3dQSD4QB8yYHqcMXao6TLe3RxWVthynne.Z6xQ1BjI6I.0FUHhVCl
 BiUiPjtuzSfY0FyCG2uNZuOC90J2a7EUIucv7DRHlKjWw4VQ53riz2Lv53Q9dW0xRTORCDDv_eR.
 PpaM2yzE_ylAz0vlCFk.2.o4eBWeg0LvdPf4Od7lMuMPXX4lSd6XgW27MJOszVuj9J6WrxecpF55
 EdPk-
X-Sonic-MF: <konrad.frederic@yahoo.fr>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ir2.yahoo.com with HTTP; Thu, 7 Apr 2022 11:28:17 +0000
Received: by kubenode514.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID d4118d93851eabd9950469976956e770; 
 Thu, 07 Apr 2022 11:28:13 +0000 (UTC)
Message-ID: <19e26661-8fe9-0e77-d21d-91ab214af42c@yahoo.fr>
Date: Thu, 7 Apr 2022 13:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Qemu-devel] [PULL 28/30] introduce xlnx-dp
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1465913645-19346-1-git-send-email-peter.maydell@linaro.org>
 <1465913645-19346-29-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA9z+BCgxa-M8EM3naC-3A4khLcS-MZCd-WjKg8JBddtTQ@mail.gmail.com>
From: Frederic Konrad <konrad.frederic@yahoo.fr>
In-Reply-To: <CAFEAcA9z+BCgxa-M8EM3naC-3A4khLcS-MZCd-WjKg8JBddtTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20001
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: pass client-ip=77.238.176.98;
 envelope-from=konrad.frederic@yahoo.fr;
 helo=sonic301-21.consmr.mail.ir2.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Le 4/7/22 à 12:32, Peter Maydell a écrit :
> On Tue, 14 Jun 2016 at 15:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> From: KONRAD Frederic <fred.konrad@greensocs.com>
>>
>> This is the implementation of the DisplayPort.
>> It has an aux-bus to access dpcd and edid.
>>
>> Graphic plane is connected to the channel 3.
>> Video plane is connected to the channel 0.
>> Audio stream are connected to the channels 4 and 5.
> 
> Very old patch, but Coverity has just pointed out an array
> overrun in it (CID 1487260):
> 
> We define a set of offsets for V_BLEND registers, of which
> the largest is this one:
> 
>> +#define V_BLEND_CHROMA_KEY_COMP3            (0x01DC >> 2)
> 
>> +static void xlnx_dp_vblend_write(void *opaque, hwaddr offset,
>> +                                 uint64_t value, unsigned size)
>> +{
>> +    XlnxDPState *s = XLNX_DP(opaque);
>> +    bool alpha_was_enabled;
>> +
>> +    DPRINTF("vblend: write @0x%" HWADDR_PRIX " = 0x%" PRIX32 "\n", offset,
>> +                                                               (uint32_t)value);
>> +    offset = offset >> 2;
>> +
>> +    switch (offset) {
> 
>> +    case V_BLEND_CHROMA_KEY_COMP1:
>> +    case V_BLEND_CHROMA_KEY_COMP2:
>> +    case V_BLEND_CHROMA_KEY_COMP3:
>> +        s->vblend_registers[offset] = value & 0x0FFF0FFF;
> 
> We use V_BLEND_CHROMA_KEY_COMP3 as an index into the vblend_registers array...
> 
>> +        break;
>> +    default:
>> +        s->vblend_registers[offset] = value;
>> +        break;
>> +    }
>> +}
> 
>> +#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
>> +#define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
>> +#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
>> +#define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
> 
>> +    uint32_t vblend_registers[DP_VBLEND_REG_ARRAY_SIZE];
> 
> ..but we have defined DP_VBLEND_REG_ARRAY_SIZE to 0x1DF >> 2,
> which is the same as 0x1DC >> 2, and so the array size is too small.
> 
> The size of the memory region is also suspicious:
> 
> +    memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
> +                          ".v_blend", 0x1DF);
> 
> This is a "32-bit accesses only" region, but we have defined it with a
> size that is not a multiple of 4. That looks wrong... (It also means
> that rather than having an array overrun I think the actual effect
> is that the guest won't be able to access the last register, because
> it's not entirely within the memoryregion.)

arg, sorry for that..

I share your point, it should not be possible to access it, but using
the monitor:

(qemu) info mtree
...
00000000fd4aa000-00000000fd4aa1de (prio 0, i/o): xlnx.v-dp.v_blend
...

I can actually read that register (at least it doesn't complain, on an
older qemu version though):
(qemu) xp /w 0xfd4aa1dc
00000000fd4aa1dc: 0x00000000

So I'm not totally sure.. do you need a patch for 7.0.0?

> 
> Coverity doesn't complain about it, but the DP_CORE_REG_ARRAY_SIZE
> may also have a similar problem.

I think it doesn't complain because writing to the last register doesn't
actually write into the array but update the mask register instead:

     case DP_INT_DS:
         s->core_registers[DP_INT_MASK] |= ~value;
         xlnx_dp_update_irq(s);
         break;

> 
> thanks
> -- PMM

Best Regards,
Fred

