Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3E4D2486
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 23:55:00 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRijK-0006F9-KU
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 17:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRihN-0005Ot-Gu
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:52:57 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=43678
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRihL-0006f2-Fz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:52:56 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id g26so717802ybj.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 14:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZcURH1zAFiUTayS/1I/47ni6JDvnLrFa5nSVuSyQW1w=;
 b=tr5zJknd1Geafsowh6HLzAtg4LI2nQigePV6dRLrW6M12jv/rynKEMhuuv8IzEnXY6
 j2AdAUThFynW62VfUY8YRAnT3wgieiVaLMhN0qpyrsY8t+qqMJIDv30L9fMf4sSqUe/E
 gBUeTtnp9+b1BL6OCRfzhn4d8RyuusKudgmEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZcURH1zAFiUTayS/1I/47ni6JDvnLrFa5nSVuSyQW1w=;
 b=pCb5Ca2TpLUflk44PHKgefUsDBUmgpNTmJrToEO5ktltboKu7+wLSYpQD79FBdrE+g
 lR0VJkIo196MKsnlO+ahsS3pL6imJUKLOFaaz9G2u+MRr1qNlnAsvdmbIRwLIEoHXX8v
 BmPr/bA4f9ZJKkhscNvmUnywqhloiWD4ehdTWwu8WKwbveAHRFFwIkPS9oHeir1k1dNz
 OehGS7BJgETjnc7/dqaOJdKlbtUCCN0Pl1j0dy2X177TLeFtJKfosEAZqvmJAa4RQYM0
 zTsR3nGovuFzXcadT6dMbt3KUQXTTfDuyNon1vki0qzEuSSbR0TjLGRNzDRAAQ5aBxJ8
 NHcg==
X-Gm-Message-State: AOAM533VUZGclATK9mk+FfBr0p9vHRsHpxGtYqQa5+p+X/jt66myuRGQ
 wFIarQWDHmQzwcOsH1fPLtQRV4N9KjxI+YHSPDBa
X-Google-Smtp-Source: ABdhPJwXqQ8bsxaJAsWCFJrJwlpS0mVDgs9N6dsAttUAZytUIixu7YYUH+1TWx4GyBomGUclECSbWKiDScrlCWcAaxA=
X-Received: by 2002:a25:df02:0:b0:629:7c93:eb2e with SMTP id
 w2-20020a25df02000000b006297c93eb2emr6728020ybg.69.1646779973617; Tue, 08 Mar
 2022 14:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAE_xrPjKd0NEz3ZiYA5w+noG2XDtY0sqQYKbo=wNjAHicRw+dQ@mail.gmail.com>
In-Reply-To: <CAE_xrPjKd0NEz3ZiYA5w+noG2XDtY0sqQYKbo=wNjAHicRw+dQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Mar 2022 14:52:43 -0800
Message-ID: <CAOnJCULev3CB0rS+dhHr-0je_Wg00BNYXB9sg50J-tLMo8kONQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Heiko Stubner <heiko@sntech.de>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 5, 2022 at 10:47 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> Typo in patch title:
> s/extenstion/extension/g
>

Thanks for catching it. Will fix it.

> Regards,
> Frank Chang
>
> On Sat, Feb 26, 2022 at 3:45 PM Frank Chang <frank.chang@sifive.com> wrot=
e:
>>
>>
>>
>> Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A
>>>
>>> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>>> property. It used to parse only the single letter base extensions
>>> until now. A generic ISA extension parsing framework was proposed[1]
>>> recently that can parse multi-letter ISA extensions as well.
>>>
>>> Generate the extended ISA string by appending  the available ISA extens=
ions
>>> to the "riscv,isa" string if it is enabled so that kernel can process i=
t.
>>>
>>> [1] https://lkml.org/lkml/2022/2/15/263
>>>
>>> Suggested-by: Heiko Stubner <heiko@sntech.de>
>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> ---
>>> Changes from v2->v3:
>>> 1. Used g_strconcat to replace snprintf & a max isa string length as
>>> suggested by Anup.
>>> 2. I have not included the Tested-by Tag from Heiko because the
>>> implementation changed from v2 to v3.
>>>
>>> Changes from v1->v2:
>>> 1. Improved the code redability by using arrays instead of individual c=
heck
>>> ---
>>>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index b0a40b83e7a8..2c7ff6ef555a 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -34,6 +34,12 @@
>>>
>>>  /* RISC-V CPU definitions */
>>>
>>> +/* This includes the null terminated character '\0' */
>>> +struct isa_ext_data {
>>> +        const char *name;
>>> +        bool enabled;
>>> +};
>>> +
>>>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
>>>
>>>  const char * const riscv_int_regnames[] =3D {
>>> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, v=
oid *data)
>>>      device_class_set_props(dc, riscv_cpu_properties);
>>>  }
>>>
>>> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int ma=
x_str_len)
>>> +{
>>> +    char *old =3D *isa_str;
>>> +    char *new =3D *isa_str;
>>> +    int i;
>>> +    struct isa_ext_data isa_edata_arr[] =3D {
>>> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>>> +        { "svinval", cpu->cfg.ext_svinval },
>>> +        { "svnapot", cpu->cfg.ext_svnapot },
>>
>>
>> We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.
>> Do you mind adding them as well?
>>
>> Also, I think the order of ISA strings should be alphabetical as describ=
ed:
>> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96
>>
>> Regards,
>> Frank Chang
>>
>>>
>>> +    };
>>> +
>>> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>> +        if (isa_edata_arr[i].enabled) {
>>> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL)=
;
>>> +            g_free(old);
>>> +            old =3D new;
>>> +        }
>>> +    }
>>> +
>>> +    *isa_str =3D new;
>>> +}
>>> +
>>>  char *riscv_isa_string(RISCVCPU *cpu)
>>>  {
>>>      int i;
>>> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>>          }
>>>      }
>>>      *p =3D '\0';
>>> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>>      return isa_str;
>>>  }
>>>
>>> --
>>> 2.30.2
>>>


--=20
Regards,
Atish

