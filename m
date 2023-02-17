Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB069AAA8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSz9K-0003xs-V7; Fri, 17 Feb 2023 06:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSz9J-0003xf-K4
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:43:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSz9I-0002so-2z
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676634210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYWv//Vj+nRaAeybrcolGLSJyupBOHfwumUVVSX4IFA=;
 b=FuxTb8PDtTRdgBtDJTNbAZeYToMYPVl72gPai6RsdPB9gFJHTgs+hUcSe02FDagYrfNOE5
 8pCRJyCDbZ7VNigHLIsH9vW/6Cube28/2gy+SFoqLiNDM5Rlbioofgvz5PhiuhKPEiQkgR
 zoBSFO7ShZBsmsyyZMOhUpStt/uGKpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-ZZ3TPba6OU-BAifZ4RTgyw-1; Fri, 17 Feb 2023 06:43:27 -0500
X-MC-Unique: ZZ3TPba6OU-BAifZ4RTgyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2A373811F42;
 Fri, 17 Feb 2023 11:43:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A70F6175A2;
 Fri, 17 Feb 2023 11:43:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7AE3521E6A1F; Fri, 17 Feb 2023 12:43:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com,  Paolo Bonzini <pbonzini@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Reinoud Zandijk
 <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>,  Brad Smith <brad@comstyle.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
Date: Fri, 17 Feb 2023 12:43:25 +0100
In-Reply-To: <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de> (Stefan Weil's
 message of "Fri, 17 Feb 2023 12:05:46 +0100")
Message-ID: <87ilg0a55u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Stefan Weil <sw@weilnetz.de> writes:

> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>
>> Which 32-bit hosts are still useful, and why?
>
>
> Citing my previous mail:
>
>    I now checked all downloads of the latests installers since 2022-12-30.
>
>    qemu-w32-setup-20221230.exe =E2=80=93 509 different IP addresses
>    qemu-w64-setup-20221230.exe - 5471 different IP addresses
>
>    339 unique IP addresses are common for 32- and 64-bit, either
>    crawlers or people who simply got both variants. So there remain 170
>    IP addresses which only downloaded the 32-bit variant in the last week.
>
>    I see 437 different strings for the browser type, but surprisingly
>    none of them looks like a crawler.
>
> So there still seems to be a certain small need for QEMU installers for 3=
2-bit Windows: 170 users f=C3=BCr 32 bit only, 339 users for both 32 and 64=
 bit, 5132 users for 64 bit only.

Actual data is always welcome!

I wonder, though...  given how decrepit 32-bit-only PCs must now be, and
how well Windows 10 (the only version still supporting them) runs on
these, how many downloaders of the w32 version could (and quite probably
should) use the w64 version instead?


