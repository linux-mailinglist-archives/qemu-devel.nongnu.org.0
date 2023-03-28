Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714796CC914
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:20:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCzb-0006Fz-2y; Tue, 28 Mar 2023 13:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1phCzZ-0006Fr-6G
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:20:17 -0400
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1phCzV-0006MV-M1
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KA+gzNiQ9QaSnVaYICMesBLPV1nE3ZxUUW+C21kCmN0=; b=bgQUThqZlR/epgmjTBDP31N7Yg
 Mbi66D5eSNbaZ86/cWWu9ygNkKySRe2q+OHgvXVtmTQDegNJm78VdhmwLo+U3TV8Zbl9BoQk+qXeY
 f9Cp9iF/TwTip4Yb5oOBhIUjCJ6Lc1aNAJ6pwCcmI32tzu7QxsmjchC7siU5PWxQFw4ysvV2fkcSG
 Q869FLghWtChf/fBtm1FjS2jhKKnq1hReHY2kFjtfyrIsKZLMcaySZQT0Av3Ax3/mPFUCkUq9ZzTP
 IM+4gidfsKlSDzHCb2YE3Bf7CLBegLwIngTBo3u3zrl4EQ9MSJFsjKb/T8+acUAJ/7uruTh7Uz9Z7
 FIvE+YIg==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96-58-g4e9ed49f8)
 (envelope-from <hc981@poolhem.se>) id 1phCzT-007PNT-0i;
 Tue, 28 Mar 2023 19:20:11 +0200
Date: Tue, 28 Mar 2023 19:19:58 +0200
From: Henrik Carlqvist <hc981@poolhem.se>
To: Daniel P. =?ISO-8859-1?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: mark.cave-ayland@ilande.co.uk, hc1245@poolhem.se, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230328191958.3e3eb5e4.hc981@poolhem.se>
In-Reply-To: <ZCLzUyiDeKLfQqWT@redhat.com>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
 <20230123200937.32eb19eb.hc981@poolhem.se>
 <20230304220754.0c6ae562.hc981@poolhem.se>
 <ZCLzUyiDeKLfQqWT@redhat.com>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=mailout12.inleed.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thanks for your feedback!

On Tue, 28 Mar 2023 15:01:55 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> This is another reason why use of the '-k' switch is a bad idea. Its
> range of permissible values / vocabulary does not match the range of
> values / vocabulary needed for this hardware device.
>=20
> In https://docs.oracle.com/cd/E19683-01/806-6642/new-43/index.html
> the keyboard layouts have distinct names
>=20
> "Norway4" vs "Norway5" and "US4" vs  "US5" vs "US_UNIX5"

Those distinct names are names of files in the OS filesystem. This is a link
to a description of a patch which gives those keyboard layouts support for
the euro sign:

http://download.nust.na/pub3/solaris/patches/106839.readme

> I'd suggest a property to the escc device should take the names
> given by that reference page above. eg
>=20
>   -global escc.sunkbd_layout=3DNorway4

Would you mind if such an assignment could also be given in multiple ways,
that is:

-global escc.sunkbd_layout=3D33
-global escc.sunkbd_layout=3D0x21
-global escc.sunkbd_layout=3DUS5
-global escc.sunkbd_layout=3Den_us

would all result in the same dip switch setting 0x21?=20

The nice thing with being able to assign keyboard layouts with a string like
"en_us" is that it does not require the user to read reference documentation
from Oracle to see which odd named layouts to choose from.

The nice thing to also being able to give numerical values like 33 or 0x21 =
is
that some possible dip switch settings (like 0x20) are not mentioned in the
Oracle reference documentation, but of course they would be possible to set
with physical dip switches even though they might not be supported by the O=
S.

> the only ambguity I see is that 0x0 and 0x1 both have the same
> name (US4), which could be resolved by handling 0x0 as the default
> with an empty string perhaps.

With multiple ways to give the values as I suggest it would be possible to
give 0x0 and 0x1 as values but "US4" would allways result in one of them,
probably 0x0.=20

The default value when no value is given or when some invalid value is given
to escc.sunkbd_layout would preferably be 0x21 for backwards compability as
that is the only value you can get from the dip switch in qemu today.

Once we find a method we all agree on I am willing to rewrite my patch, but
maybe I will not be able to do it before summer when I get my vacation.

best regards Henrik

