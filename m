Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59B44F266
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 11:05:38 +0100 (CET)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlpuj-0007xK-1b
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 05:05:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlps9-0005pB-I9; Sat, 13 Nov 2021 05:02:58 -0500
Received: from [2607:f8b0:4864:20::32f] (port=42738
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlps6-0002xv-To; Sat, 13 Nov 2021 05:02:56 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso17826986otg.9; 
 Sat, 13 Nov 2021 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=6vJZTdpJIqRQqp0UT8zORt20Xx3pHl3bZG+2DifkhSo=;
 b=l9fox/WX9pZjqJz92/iAlmRKy05yettNQe77Mg8e+zN98X1S7BE6IpWIbGsGDb5FPW
 QGuNOGbS0ShEA144R5XCapKJYY+LMenl/lMs0mdBWr4GbiSmG66jjRrk/pBTI534cqHb
 oEdN2vdvs63CTaJKClaFzQZ2IwPMYy5TvxTXb8wYCkVNtSzD0bzcYZB56y+ZyaRAlC9O
 F+9ewJ3hd0M72f6FQ2cOkqq3vnOWz31u3IZ//LUURhgepgTvD0vGZesW9VQSr4fbk1ok
 BG/N+c3NDtCU3E0eAbxxQ44bBdDBVixiS/NKmHnrOxqR2RJQ0J1uAQlacSo88B3JigNs
 gYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=6vJZTdpJIqRQqp0UT8zORt20Xx3pHl3bZG+2DifkhSo=;
 b=g936GaY4C78WNt5Qk20LbKE4lytGvuNjj8C7qEEUYB27f/Hs3nmeYAcWWwdJnRWpBu
 rUgq28AQ6FH1nVouVSFg6iBi4pF8E2il6Z3AkiRel6PHfWzhaD3dTtljEynz4wiLM2Ud
 4XSOF2cC3Db0jsTUWXubJsEZT7mcc2rwWvXTrLbd+G6gNwiYwlWbNONF9ED6O/so0BPk
 Iq4w0QTH0WQWJUyUT7nhlAOlWMOKWwXaPlrViCdCZTlA4mW+CEf1IkwGsFe8c1mKEogu
 9yKMyfndX+cI5In5GJbYQSaYxXVjLs1T2ZM/qyWPY5oyBjTfeMk+MyqprBwV7Knziskv
 J6dA==
X-Gm-Message-State: AOAM532Osd00G8riW+Ii/XEfK3qsOirbl2bRCUw7i6JxlJw2B9D7vlHZ
 psA/bDWEknoYd1Y09cyHAhRoNIsEaU6nWh4KcGTA7UYMpWF/7g==
X-Google-Smtp-Source: ABdhPJxbSlCH+5B+vbBnIye80eD5tdj1ps4UbEUW5LggfMG9CItZMuVstOnNcwRrXjtXcMcR11cvUM6zhQJIXX0mCGw=
X-Received: by 2002:ab0:70cd:: with SMTP id r13mr32170820ual.99.1636797396621; 
 Sat, 13 Nov 2021 01:56:36 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 13 Nov 2021 17:56:23 +0800
Message-ID: <CAE2XoE9n_ACTHWoykEvLMS7ctXTk4sRoDTjNT_gOMAetSKRekA@mail.gmail.com>
Subject: Idea about float acceleration with tcg
To: qemu-level <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000065201a05d0a89727"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065201a05d0a89727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainly talking about x86 target platform, on x86. I write the following cod=
e
for testing with float exception

```rust
#![feature(asm)]
use core::arch::x86_64::*;
use std::time::Instant;

/*
00011111 10100000
00011111 10000000
54321098 76543210
*/

/*
Pnemonic Bit Location Description
FZ bit 15 Flush To Zero

R+ bit 14 Round Positive
R- bit 13 Round Negative
RZ bits 13 and 14 Round To Zero
RN bits 13 and 14 are 0 Round To Nearest

PM bit 12 Precision Mask
UM bit 11 Underflow Mask
OM bit 10 Overflow Mask
ZM bit 9 Divide By Zero Mask
DM bit 8 Denormal Mask
IM bit 7 Invalid Operation Mask
DAZ bit 6 Denormals Are Zero
PE bit 5 Precision Flag
UE bit 4 Underflow Flag
OE bit 3 Overflow Flag
ZE bit 2 Divide By Zero Flag
DE bit 1 Denormal Flag
IE bit 0 Invalid Operation Flag
*/

fn test_double_div(a: f64, b:f64, init_csr: u32, ops: u32) {
    let mut final_csr: u32 =3D 0;
    let mut count =3D 0;
    let mut c: f64 =3D 0.0;
    let now =3D Instant::now();
    unsafe {
        for _i in 0..ops {
            final_csr =3D _mm_getcsr();
            if final_csr !=3D init_csr {
                count +=3D 1;
                _mm_setcsr(init_csr);
            }
            let ma =3D _mm_set1_pd(a);
            let mb =3D _mm_set1_pd(b);
            let mc =3D _mm_div_pd(ma, mb);
            c +=3D  _mm_cvtsd_f64(mc);
        }
    }
    let m_opts =3D ops as f64 / 1024.0/1024.8;

    println!("final csr: {} flops:{} count:{} c:{}",
    final_csr, m_opts / now.elapsed().as_secs_f64(), count, c);
}

fn main() {
    let init_csr: u32;
    unsafe {
        println!("first csr:{}", _mm_getcsr());
        // _mm_setcsr((_mm_getcsr() & !0x8040) | 0b100000); // Initially
set inexact bit
        _mm_setcsr(_mm_getcsr() & !0x8040); // Disable `Flush To Zero` and
`Denormals Are Zero`
        init_csr =3D _mm_getcsr();
        println!("init_csr:{}", init_csr);
    }
    let ops =3D 256 * 1024 * 1024;
    for _ in 1..5 {
        test_double_div(6.0f64, 6.0f64, init_csr, ops);
        test_double_div(6.0f64, 5.0f64, init_csr, ops);
        test_double_div(6.0f64, 6.0f64, init_csr, ops);
        test_double_div(6.0f64, 7.0f64, init_csr, ops);
    }
}
```

Amd ryzen 3950x test result:
```
cargo run --release
    Finished release [optimized] target(s) in 0.00s
     Running `target\release\xemu-float.exe`
first csr:8064
init_csr:8064
final csr: 8064 flops:199.95805114656875 count:0 c:268435456
final csr: 8096 flops:183.20469224891 count:268435454 c:322122545.5686275
final csr: 8064 flops:201.86001192537793 count:1 c:268435456
final csr: 8096 flops:183.08332320794779 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:196.64067223704072 count:1 c:268435456
final csr: 8096 flops:181.63963551098507 count:268435454 c:322122545.568627=
5
final csr: 8064 flops:201.74742194716032 count:1 c:268435456
final csr: 8096 flops:182.57995318163572 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:200.94880783384463 count:1 c:268435456
final csr: 8096 flops:182.80824315169866 count:268435454 c:322122545.568627=
5
final csr: 8064 flops:201.20301405393934 count:1 c:268435456
final csr: 8096 flops:182.99063466809466 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:201.89608256173372 count:1 c:268435456
final csr: 8096 flops:182.46839074321227 count:268435454 c:322122545.568627=
5
final csr: 8064 flops:201.6361495464766 count:1 c:268435456
final csr: 8096 flops:181.2901173261191 count:268435454 c:230087534.2222222
```

Intel i7-8750H test result:
```
cargo run --release
    Finished release [optimized] target(s) in 0.01s
     Running `target\release\xemu-float.exe`
first csr:8064
init_csr:8064
final csr: 8064 flops:919.039615426437 count:0 c:268435456
final csr: 8096 flops:128.06695571065126 count:268435454 c:322122545.568627=
5
final csr: 8064 flops:908.9774298981789 count:1 c:268435456
final csr: 8096 flops:127.67450912501586 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:911.2272033144177 count:1 c:268435456
final csr: 8096 flops:124.61355141244842 count:268435454 c:322122545.568627=
5
final csr: 8064 flops:921.2731718357994 count:1 c:268435456
final csr: 8096 flops:128.68833918242356 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:936.8098900696564 count:1 c:268435456
final csr: 8096 flops:126.0582659518433 count:268435454 c:322122545.5686275
final csr: 8064 flops:915.392964318394 count:1 c:268435456
final csr: 8096 flops:126.88957390875404 count:268435454 c:230087534.222222=
2
final csr: 8064 flops:923.3882629699333 count:1 c:268435456
final csr: 8096 flops:120.6875203037403 count:268435454 c:322122545.5686275
final csr: 8064 flops:915.0317886715162 count:1 c:268435456
final csr: 8096 flops:125.19570682160303 count:268435454 c:230087534.222222=
2
```

That's means read mxcsr register is very fast in Intel x64 processor
read mxcsr register is slow on AMD x64 processor
read/write mxcsr register is about 4x slow on AMD processor and 8x slow  on
Intel processor, we can take advantage of these when
accleration target float instructions.


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000065201a05d0a89727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Mainly talking about x86 target platform, on x86. I write =
the following code<div>for testing with float exception</div><div><br></div=
><div>```rust</div><div>#![feature(asm)]<br>use core::arch::x86_64::*;<br>u=
se std::time::Instant;<br><br>/*<br>00011111 10100000<br>00011111 10000000<=
br>54321098 76543210<br>*/<br><br>/*<br>Pnemonic	Bit Location	Description<b=
r>FZ	bit 15	Flush To Zero<br><br>R+	bit 14	Round Positive<br>R-	bit 13	Roun=
d Negative<br>RZ	bits 13 and 14	Round To Zero<br>RN	bits 13 and 14 are 0	Ro=
und To Nearest<br><br>PM	bit 12	Precision Mask<br>UM	bit 11	Underflow Mask<=
br>OM	bit 10	Overflow Mask<br>ZM	bit 9	Divide By Zero Mask<br>DM	bit 8	Deno=
rmal Mask<br>IM	bit 7	Invalid Operation Mask<br>DAZ	bit 6	Denormals Are Zer=
o<br>PE	bit 5	Precision Flag<br>UE	bit 4	Underflow Flag<br>OE	bit 3	Overflo=
w Flag<br>ZE	bit 2	Divide By Zero Flag<br>DE	bit 1	Denormal Flag<br>IE	bit =
0	Invalid Operation Flag<br>*/<br><br>fn test_double_div(a: f64, b:f64, ini=
t_csr: u32, ops: u32) {<br>=C2=A0 =C2=A0 let mut final_csr: u32 =3D 0;<br>=
=C2=A0 =C2=A0 let mut count =3D 0;<br>=C2=A0 =C2=A0 let mut c: f64 =3D 0.0;=
<br>=C2=A0 =C2=A0 let now =3D Instant::now();<br>=C2=A0 =C2=A0 unsafe {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for _i in 0..ops {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 final_csr =3D _mm_getcsr();<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if final_csr !=3D init_csr {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count +=3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _mm_setcsr(init_csr);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let=
 ma =3D _mm_set1_pd(a);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mb=
 =3D _mm_set1_pd(b);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mc =
=3D _mm_div_pd(ma, mb);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c +=3D=
 =C2=A0_mm_cvtsd_f64(mc);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0=
 }<br>=C2=A0 =C2=A0 let m_opts =3D ops as f64 / 1024.0/1024.8;<br><br>=C2=
=A0 =C2=A0 println!(&quot;final csr: {} flops:{} count:{} c:{}&quot;,<br>=
=C2=A0 =C2=A0 final_csr, m_opts / now.elapsed().as_secs_f64(), count, c);<b=
r>}<br><br>fn main() {<br>=C2=A0 =C2=A0 let init_csr: u32;<br>=C2=A0 =C2=A0=
 unsafe {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;first csr:{}&quot;,=
 _mm_getcsr());<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 // _mm_setcsr((_mm_getcsr() =
&amp; !0x8040) | 0b100000); // Initially set inexact bit<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _mm_setcsr(_mm_getcsr() &amp; !0x8040); // Disable `Flush To =
Zero` and `Denormals Are Zero`<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_csr =3D =
_mm_getcsr();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;init_csr:{}&quo=
t;, init_csr);<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 let ops =3D 256 * 1024 *=
 1024;<br>=C2=A0 =C2=A0 for _ in 1..5 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test=
_double_div(6.0f64, 6.0f64, init_csr, ops);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
test_double_div(6.0f64, 5.0f64, init_csr, ops);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 test_double_div(6.0f64, 6.0f64, init_csr, ops);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 test_double_div(6.0f64, 7.0f64, init_csr, ops);<br>=C2=A0 =C2=A0 }<=
br>}<br></div><div>```</div><div><br></div><div>Amd ryzen 3950x test result=
:</div><div>```</div><div>cargo run --release<br>=C2=A0 =C2=A0 Finished rel=
ease [optimized] target(s) in 0.00s<br>=C2=A0 =C2=A0 =C2=A0Running `target\=
release\xemu-float.exe`<br>first csr:8064<br>init_csr:8064<br>final csr: 80=
64 flops:199.95805114656875 count:0 c:268435456<br>final csr: 8096 flops:18=
3.20469224891 count:268435454 c:322122545.5686275<br>final csr: 8064 flops:=
201.86001192537793 count:1 c:268435456<br>final csr: 8096 flops:183.0833232=
0794779 count:268435454 c:230087534.2222222<br>final csr: 8064 flops:196.64=
067223704072 count:1 c:268435456<br>final csr: 8096 flops:181.6396355109850=
7 count:268435454 c:322122545.5686275<br>final csr: 8064 flops:201.74742194=
716032 count:1 c:268435456<br>final csr: 8096 flops:182.57995318163572 coun=
t:268435454 c:230087534.2222222<br>final csr: 8064 flops:200.94880783384463=
 count:1 c:268435456<br>final csr: 8096 flops:182.80824315169866 count:2684=
35454 c:322122545.5686275<br>final csr: 8064 flops:201.20301405393934 count=
:1 c:268435456<br>final csr: 8096 flops:182.99063466809466 count:268435454 =
c:230087534.2222222<br>final csr: 8064 flops:201.89608256173372 count:1 c:2=
68435456<br>final csr: 8096 flops:182.46839074321227 count:268435454 c:3221=
22545.5686275<br>final csr: 8064 flops:201.6361495464766 count:1 c:26843545=
6<br>final csr: 8096 flops:181.2901173261191 count:268435454 c:230087534.22=
22222<br></div><div>```</div><div><br></div><div>Intel=C2=A0i7-8750H test r=
esult:</div><div>```</div><div>cargo run --release<br>=C2=A0 =C2=A0 Finishe=
d release [optimized] target(s) in 0.01s<br>=C2=A0 =C2=A0 =C2=A0Running `ta=
rget\release\xemu-float.exe`<br>first csr:8064<br>init_csr:8064<br>final cs=
r: 8064 flops:919.039615426437 count:0 c:268435456<br>final csr: 8096 flops=
:128.06695571065126 count:268435454 c:322122545.5686275<br>final csr: 8064 =
flops:908.9774298981789 count:1 c:268435456<br>final csr: 8096 flops:127.67=
450912501586 count:268435454 c:230087534.2222222<br>final csr: 8064 flops:9=
11.2272033144177 count:1 c:268435456<br>final csr: 8096 flops:124.613551412=
44842 count:268435454 c:322122545.5686275<br>final csr: 8064 flops:921.2731=
718357994 count:1 c:268435456<br>final csr: 8096 flops:128.68833918242356 c=
ount:268435454 c:230087534.2222222<br>final csr: 8064 flops:936.80989006965=
64 count:1 c:268435456<br>final csr: 8096 flops:126.0582659518433 count:268=
435454 c:322122545.5686275<br>final csr: 8064 flops:915.392964318394 count:=
1 c:268435456<br>final csr: 8096 flops:126.88957390875404 count:268435454 c=
:230087534.2222222<br>final csr: 8064 flops:923.3882629699333 count:1 c:268=
435456<br>final csr: 8096 flops:120.6875203037403 count:268435454 c:3221225=
45.5686275<br>final csr: 8064 flops:915.0317886715162 count:1 c:268435456<b=
r>final csr: 8096 flops:125.19570682160303 count:268435454 c:230087534.2222=
222<br></div><div>```</div><div><br></div><div>That&#39;s means read=C2=A0m=
xcsr register is very fast in Intel x64 processor</div><div>read mxcsr regi=
ster is slow on AMD x64 processor</div><div>read/write mxcsr register is ab=
out 4x slow on AMD processor and 8x slow=C2=A0 on Intel processor, we can t=
ake advantage of these when</div><div>accleration target float instructions=
.</div><div><br></div><div><br></div><div><div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=
=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div></div>=
</div></div>

--00000000000065201a05d0a89727--

