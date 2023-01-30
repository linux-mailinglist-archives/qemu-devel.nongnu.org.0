Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E5680DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:33:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTJw-0003iK-6r; Mon, 30 Jan 2023 07:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pMTJt-0003i8-HW
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:31:33 -0500
Received: from sonic312-23.consmr.mail.gq1.yahoo.com ([98.137.69.204])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pMTJq-0004uh-9r
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1675081886; bh=BN3svwq985TnlFO3Vd9zLty0Kyu41yjABsydoNimKOQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=EGIO3pGT4hGCakA7D3HIe2jSoJPbC2vtVVm7IBqhejp9uRbTeNFnNLhStFrLRW8YHMJ6HDdzGwQs5534JHNNUY+fqY/ArXlcQeO1qk89mcgVIyS76WzexEwcFUUUJAjZZGW20+xEOv24zdrI7x/0645Mx8jpob/GLAfC8l/xtjQrDNMBdyYOtkyyHjEPon6mdug2PYYClOZs/dz85obli4kaJeQkSglSu//8Q0O9Ubz+YeNLmQFeMKIbSsMo4uDMIEIZT4gkxX9XatiS5AXtnqWM8cXqcS5XXmffxDsAfgo3k+Gbt0rjiz4JFyGSn6daMBf4UEo3EeHlzfHQhu0BCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1675081886; bh=H24+lhAIZJhcjrbgXBJldiulJQ26cwoB8hU3EDtAP76=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=VHV/Lunk3WGwoACGZv7R/a+XTpQABj6HgQd8oJQ9RqptqSUqPvdV21Kz0USzx2LtBfDyPTQFiMjJ8HQhgwNuJSqqJ5Yvv/JNFu1i5000bXeFStta1zcKHKlRXUH5w5dvu7Ya+HkgsYgiifgPO82O9G/bWljBN+jV2RCUNdi6v2zWxHMRxZa8MEasCRJafNTI3OeLUpgxQnix6/FbvTL9hj07LciInQuFBDQ1FzJrdnPRZ0M4QAk9I1cxPsUgTujPnIqPuKJmFVXINozqAwBy7+mtCSTI5/gk0hQ6V9Ptkc2uTp64tFrcp3IuR8IaBHwnbcZocxGwpa3j8f+MzcUjsw==
X-YMail-OSG: 75jVJ18VM1lCIuSRhQGinky175UXBfXAD5hh0bUe.3n1V6X8zHeFjvY.tOd5ZOS
 u9ZPO7PY6QsLUKPtjjl4DuHikscDMIqoIbRQdqG2ibl_yDqqUme6CjkC2PqHGfKQMTKYXl.nUhz1
 nNW54M43.ehyZfhZamjqW7q4hrIHmCm_2OPSUfhAhEhbC3UrFW8GBXa1P7069BLtVNv_PMzX6Eg8
 hPQUMlBvqhiVNm3KL965lBODYq9N13XxTr.PMHukVI5kzMchJV1Y.n2LkdTfHfdgQxa8ZjfR3Io.
 TTdoL7ISfMR9tLkVb3VcZW.YdCqYr1sDHpWMYxmRTQyYTN32rOPAOKrTd7pyyfcMDMJrM4dukN2L
 7nt.jOHrbCbRURp7Ovcwu4GpNjYZSyNCTbtc9Uc8Le3EbvAi3uqxGQgo44nKugO3PaouWfLCwJ0.
 V0SFLq.1RPof10Jus8Y9ZFGR42q1wEXrLWEXpuXRHJpbXT9aIaU2rUhoU9aIFQZGTY982xdjbirX
 wF3O3k.jib3ZzbnnNWIxK8fYM62xT407TFJxKm8qNi3mOMQucqfw7VKW1jsQ0M1uJTWXYUvHqgmz
 nL85hKfsr2p81aeGHw_Sl9khDj.hL5t_oZ732.WsUfcGJyvknOoknjnaNifD7dFOvv.PCtoz51d.
 _OSgA7N7S5JOl3odK7n2jbe6inHTZugHSBOSxNgTsBVI0gmrUR_IMR2fLaOwIsz_GaTGOe_K_Cu_
 Nia2Ibb1BMbD3EAlwFRgt1ExlrCr9lrL.9kzY9XfCxwyj_YZSd5plxOT8oVESSoljpcKU.DY0mKe
 DGyE1TuyoV0obMsTOUl.rqLaM45mnzPfPz3FdASe4p7wTE61IL0eCgfhiNIgKfhERjBi_yInSMAK
 8UY4hM36_Ov6Z..6O4gSBmue4m6vUPBOe.6XJBOiOL_6i5ONgWkrz85el85vLbIYEkNwV_3qLi4.
 3.E6AvYviEAMQw0TcomsuQZwtmimOTm4o.gsSpqmPv1sTXbOwht3rb2WScCHjXWVBLLNYOGyxju2
 2E2g.8TOUA5M.A2ez2l9ChKiY_zdagS7d8yL92XxzyBt4YcDUK4QFQ0ME9jaz0OkVFJn.tja7mVi
 O9iJLEU5WKY2aleMpkNZZM5Vpg1M1anNG6ZoKixrcCMEnos8TBKUW4nTQ4gQIy6lbVhYGX5o384h
 xoPTJs0g6HmQkmednfR1rDV2z1xFmD6Qlq2oDBtOZlph7Vbn.MfPSwLdm9teNx7FOMimd1RjRgjk
 qGmnQ6kkv7gvCHyJute3SLUutwJ_TArjIb4.t7wde9AjNux1O9DK2DGwt1oM4BWw2z7iA549Ea4a
 fS17n1U.6uF8CQkOGVcrou6NgKCYe0ODqpPk2JtW9D.6szS9bzOvlpvkccEZwwmWAJ3wUY7VeChp
 L.uTWw_sAfP80O1eq_qxSm9ewKYRySwvu4IffD7ME5Lu.nanVPiKLjoMibY3DuGQBxknK_bMbopF
 PlqH9wdTgXCNpePzaT2s6tZ6XmCAodmdoqRqJB7rm3GVUSEzlJWeE9BJKqAV_ANr78aRvoRTvgtW
 6NuTzFXUVo8V7Vzwk1.QFJp81Uhi1LuWg2fL5uZvc7bb_lXz2xht_joyE.q59VbnhDu4BmkCdzdZ
 OlyP95kMJ8vpjZT2MAjnm.mz4CVxdUhl2JImCDsscs6XS9gxDaS1debMr.GtGjfFakxVUN9hgsv9
 PsxbTRMHXfkqWqq_iWYlrAfjDxwUBHMA0wQ2kSEPytZ0_c_8hsPJAeMWUze4Nf73Q8dI1OSAmHMn
 g6WJDClHiy.rvXg_Ky_dh_ucrJ1fMKDbLo9gP5JogHn7oNVp5cKPzHikiIf4ol5WzYWKHo_UksD4
 sx1DCDauXvHfxSZuYg5pjnwCe_4Owzxgwmrf01oiiG9Nkp0tMj2hYJJOcBKtfWKAA2ByZRJDzW8m
 iEHPKocOo6B.vl.U3tq16FP07.22aFtTLhKNeSgXpxthNMcO0cEwtpIUw5I9ul7Nct2p3uvQ0LjD
 WGeG3L4p0KM7FoLWR3InGx0VV7z6Iy1svLr0uM6nsFCPfhJmL538lfcYlaIg34mRaNFq4e3HMIJM
 hJXjm38xju3wqVcDCXQdCrnJqO.pMiNXc8_gu098bxwl4bZ6Hwg9NjPjg.8jONMqgUOiZCcNNsAt
 _q9MEQ7U44dasSAuZOiayZlpLVdK66u1jY_UPlOd2ubaWYkFVdfBIOqNOCzz1kI8SU5DG.JX_W8l
 blqzvuA2p
X-Sonic-MF: <nealelliott@netscape.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Mon, 30 Jan 2023 12:31:26 +0000
Date: Mon, 30 Jan 2023 12:31:23 +0000 (UTC)
From: Neal Elliott <nealelliott@netscape.net>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <344360437.1045591.1675081884010@mail.yahoo.com>
In-Reply-To: <CAEUhbmWrHrqZdUDwm-OMRQHh8fBsQ3NPdDWdYRDgowmcXu_1gA@mail.gmail.com>
References: <1614627941.1033038.1675072872015.ref@mail.yahoo.com>
 <1614627941.1033038.1675072872015@mail.yahoo.com>
 <CAEUhbmWrHrqZdUDwm-OMRQHh8fBsQ3NPdDWdYRDgowmcXu_1gA@mail.gmail.com>
Subject: Re: unable to use "-net user" argument after building from master
 branch
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.21123 AolMailNorrin
Received-SPF: pass client-ip=98.137.69.204;
 envelope-from=nealelliott@netscape.net;
 helo=sonic312-23.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

thank you, that worked perfect!=C2=A0






On Monday, January 30, 2023 at 05:08:00 AM EST, Bin Meng <bmeng.cn@gmail.co=
m> wrote:=20





On Mon, Jan 30, 2023 at 6:01 PM Neal Elliott <nealelliott@netscape.net> wro=
te:

>
> hello,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I'm unable to use the "-net user=
" argument with the compiled "qemu-system-x86_64" binary. I get an error: "=
qemu-system-x86_64: -net user: network backend 'user' is not compiled into =
this binary"
>
> I don't know what I'm missing when I used the configure script with the f=
ollowing arguments:
>
>=C2=A0 ../configure --enable-linux-user --enable-user --enable-curses --en=
able-vhost-net --enable-vhost-user --enable-png
>
> what am I doing wrong? what other arguments do I need to add to allow the=
 "-net user" option to work?

>

Please install libslirp dev package for your host distribution.

Regards,
Bin


