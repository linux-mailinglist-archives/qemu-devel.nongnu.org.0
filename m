Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED733F0FA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:18:00 +0100 (CET)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMW3j-0002ng-Pw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lMW2D-0001zh-Cb
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:16:25 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:47332 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lMW2A-0000NH-RO
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:16:25 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BE1424124F;
 Wed, 17 Mar 2021 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1615986977;
 x=1617801378; bh=H9k2/yWd8R1Nvaok9SUG8TDBrcL+Vn5gr16Ku2ezEWA=; b=
 E+ELzaeHwH6G98i+Eca+Bg07bmGSgvvjjb59yKQCM6s6OR78U8Ci6O27wvmf5vLT
 JQYnI8TQgR4ORjnRtPeY+/cmyXFU4kKRdwGATrf/9O1JtZhalGNc8KIO4rUIpc2A
 8Od0tROnMKJf8tBD9Fpgi7S9L/J+Ezn1YwC8LNNGMIA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkANHlFg1_F3; Wed, 17 Mar 2021 16:16:17 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9A66741207;
 Wed, 17 Mar 2021 16:16:16 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 17
 Mar 2021 16:16:16 +0300
Date: Wed, 17 Mar 2021 16:16:15 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
Message-ID: <YFIBH1xIeTAep9p4@SPB-NB-133.local>
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
 <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
 <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 01:44:05PM +0100, Thomas Huth wrote:
> On 17/03/2021 12.16, Peter Maydell wrote:
> > On Wed, 17 Mar 2021 at 11:09, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > FreeBSD version 12.1 is out of service now, and the task in the
> > > Cirrus-CI is failing. Update to 12.2 to get it working again.
> > > Unfortunately, there is a bug in libtasn1 that triggers with the
> > > new version of Clang that is used there (see this thread for details:
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
> > > so we have to disable gnutls for now to make it work again. We can
> > > enable it later again once libtasn1 has been fixed in FreeBSD.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > Is it feasible to make configure check for "is libtasn1 broken"?
> > I guess since it only shows up as "when you try to use it
> > it fails" that would be a runtime check rather than compile
> > time, which isn't really possible :-(
> 
> I don't really have a clue about this crypto stuff... Daniel, Stefan, Roman,
> Christian, Eric ... you debugged the original problem on macOS, do you think
> it's possible to add a check for this libtasn1 problem to our "configure"
> (or meson.build file)?
> 

Hi,

We need to define an ASN.1 object

https://gitlab.com/gnutls/libtasn1/-/blob/master/tests/Test_tree.c#L230

  {ACT_CREATE, "TEST_TREE.OidAndTimeTest", 0, 0, ASN1_SUCCESS, __LINE__},

The object is:
OidAndTimeTest ::= SEQUENCE{
   set     SET OF INTEGER,
   oid     OBJECT IDENTIFIER,
   time2   GeneralizedTime,
   bol     BOOLEAN,
   oct     OCTET STRING,
   bit     BIT STRING OPTIONAL,
   bol2    BOOLEAN DEFAULT TRUE,
   enum    ENUMERATED {v1(1),v2(2)} DEFAULT v1,
   any     [1] ANY OPTIONAL,
   gen     GeneralString OPTIONAL,
   time1   UTCTime
}

Create it with:

asn1_create_element (definitions, "TEST.OidAndTimeTest", &asn1_element);

and try to get it's DER length to mimic the part of the failing test:

https://gitlab.com/gnutls/libtasn1/-/blob/master/tests/Test_tree.c#L254

  result = asn1_der_coding (asn1_element, "", NULL, &der_len, errorDescription);

The result should be ASN1_MEM_ERROR.

Something like this should work as configure-time test.

Thanks,
Roman

