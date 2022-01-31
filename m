Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984074A3E43
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:37:35 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERFm-0006fG-Io
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1nEQke-0003Bo-5Y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:05:32 -0500
Received: from rev.ng ([5.9.113.41]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1nEQkZ-0003vf-0Y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AoXg/gzTVwldsn3GqtZw5pYgm3QUPJjnXfbatmXx9bc=; b=NuNV1O5SOx9oSNuh+t4R+DHCGK
 5bdC5+Hv5kn1WRWwLQ5oh6jN0U3HkDg4foTy2CF7d4Z4D3QaObrEplRrhiNROkLvLufh8DsL5eDlq
 O5DQD28njk2MoqUnvorNpuy1bYXbZXoug6MUHy7pAB6Mc4d3tZ1EJm40Dw/zlJILMjuo=;
Date: Mon, 31 Jan 2022 08:04:59 +0100
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= via <qemu-devel@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Ed Maste
 <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>, Michael Tokarev
 <mjt@tls.msk.ru>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Xiang Chen <chenxiang66@hisilicon.com>, Jonathan
 Cameron <Jonathan.Cameron@Huawei.com>, Longpeng <longpeng2@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Vasilev Oleg
 <vasilev.oleg@huawei.com>, Anton Johansson <anjo@rev.ng>, Michael Roth
 <michael.roth@amd.com>
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Message-ID: <20220131080459.456a0b55@orange>
In-Reply-To: <c1dcf128-84e8-a3ce-8b9f-f0a409b34b00@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org>
 <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
 <87ee4xdjjp.fsf@linaro.org>
 <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
 <c1dcf128-84e8-a3ce-8b9f-f0a409b34b00@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Tue, 25 Jan 2022 11:59:38 +0100
Philippe Mathieu-Daud=C3=A9 via <qemu-devel@nongnu.org> wrote:

> I'm seeing the same issue with these domains since mid december:
>=20
> ...
> - rev.ng
>=20
> ...
> https://lore.kernel.org/qemu-devel/20220105185720.0d4fc159@orange/
> ...

I've tried to look into this and it looks like our set up should be OK.
We enabled SPF (i.e., a rule stating that only our mailserver can send
e-mail with our domain in "From:") and DKIM (i.e., our mailserver signs
certain portions of the e-mail). We also enabled DMARC which
coordinates the two.

Now, as far as I understand, mailing lists can either rewrite the
"From" header (as qemu-devel does) or leave it as it is. In the latter
situation, SPF will fail but DMARC should instruct MTAs to check
DKIM, and that should pass.

    https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html
    https://dmarc.org/wiki/FAQ#I_operate_a_mailing_list_and_I_want_to_inter=
operate_with_DMARC.2C_what_should_I_do.3F

DKIM signature can be corrupted in case the mailing list tampers with
the subject or the body of the e-mail, but this doesn't seem to be the
case: I've tried to manually verify the DKIM signature of the same
e-mail that I got both from the mailing list and directly from the
sender (I was in Cc), and they both verify correctly.

tl;dr I *think* rewriting the From header should not be necessary for
our domain.

If you guys think this is not the case and there's something we can do
to improve the situation (other than adding gmail.com to our SPF
record), let me know.

--=20
Alessandro Di Federico
rev.ng Labs

