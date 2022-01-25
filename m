Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F205149B7FA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:52:39 +0100 (CET)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCO7a-0000v8-GN
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nCO2c-0006xJ-3V
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nCO2Y-0004X7-Ky
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643125645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcGkI6PkXeikQdk1yAwicU2hiWF3U8Tqlc37OA0EOdU=;
 b=hBb/Dk2twI8y0dmdfiy3EPxpCCKmAjSCDKwBqgzwwJLeh/oVam1iAqllCobglOub7nAzW5
 q8f+8mz1lXIhwJRX5xXitpPl+6VtxdpHLeXpnZFiUt6z2GsRfnPtzAgvhY+osED4CNjr3M
 pdnolNNAf6TcQD56xHjBVSIEgg7FtA4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-xfrkcOchMG29XPwiR8f9tQ-1; Tue, 25 Jan 2022 10:47:23 -0500
X-MC-Unique: xfrkcOchMG29XPwiR8f9tQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 a18-20020aa7d752000000b00403d18712beso15257502eds.17
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 07:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :references:content-language:to:from:in-reply-to;
 bh=0aVX0lOzuC02KLIRkaz2gq+IpxR71lqdoP+MYqeiv7A=;
 b=QSFvP6RY2GNZ56avQFjkEZM9ITUpiExr3SPRjcdpZj2XA0q6qQ/ipBlMB5ny9ILObY
 jpxtUPpBe1HnAI3Wc9u2I4cQHnn/1wyLY8x10tWvz9n0g4lIfSLox8sT/K52bfyfG8WN
 4vgs2PGfwWjAgk+55CQsM0mUv5of2AgI02xPF9ilnEVjFquvGl6ZTFHdF+dlhX8Zc5HP
 1qCG8cDqp4ZrDnuDliKUg50kBdlKaaqA3aOegijTIMxSIC2V3AL+LXEnYKWkfld6J9oi
 GkKgLcuQVH0n5N9pVrz7upi2KsR//wjafkC9ygjAqvJTKqYq7Sz9xS0mCJ80Y3EMlIh3
 Ondg==
X-Gm-Message-State: AOAM5313z+9m/R5SQTCowLZMMY+9esnDZpr+soL7kFugwLvydKbCoCsg
 TlYkStWrv7mJp6ut4OwVVyyF60ecsNlqCh191ysSIoxvaL3AH4pX4AJl+dsu9+kB/kkBZH8utQO
 TDmnaA4g4pgJ8pxxBxxDbJTyxWhb2kI6Ga+yCX0pPagqlj7WuLxYvUVUDmCpsKhXyWZA=
X-Received: by 2002:a17:906:6a0c:: with SMTP id
 qw12mr16838016ejc.483.1643125642157; 
 Tue, 25 Jan 2022 07:47:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBQgjJqyhkRAALqgoGyLIXcb9XhVP555GdRr0gYrFUe4Q2EG9FIAWNdPgf35A8L5+h3oMyHA==
X-Received: by 2002:a17:906:6a0c:: with SMTP id
 qw12mr16837988ejc.483.1643125641751; 
 Tue, 25 Jan 2022 07:47:21 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id s7sm6302852ejo.212.2022.01.25.07.47.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 07:47:20 -0800 (PST)
Message-ID: <2dc0c8a9-a10a-6d13-7f62-de93c5b3c795@redhat.com>
Date: Tue, 25 Jan 2022 16:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Fwd: BU Organization IC 6 Consulting Level Promotions
References: <CALTjFQCrdTK5=39QQKMLeGoAJsHSHC8KhUpB4bXJs-FCeCSc8w@mail.gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CALTjFQCrdTK5=39QQKMLeGoAJsHSHC8KhUpB4bXJs-FCeCSc8w@mail.gmail.com>
X-Forwarded-Message-Id: <CALTjFQCrdTK5=39QQKMLeGoAJsHSHC8KhUpB4bXJs-FCeCSc8w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------qvGd0soXBsfDXRgmbEc0h2lf"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------qvGd0soXBsfDXRgmbEc0h2lf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

maybe theis was already discussed earlier, but anyway: do we already 
have an idea about whether (and if so how) BU "consulting" level 
associates will participate in the DE community?  This will be more 
important as their ranks grow.

Thanks,

Paolo

-------- Forwarded Message --------
Subject: 	BU Organization IC 6 Consulting Level Promotions
Date: 	Tue, 25 Jan 2022 10:12:54 -0500
From: 	Ashesh Badani <abadani@redhat.com>
To: 	prod-dept <prod-dept@redhat.com>



In 2021, I tasked several BU leaders to work on reviewing and 
standardizing the promotion process for BU associates going from the 
Senior Principal level (IC5) to the Consulting level (IC6). As a result 
of this effort, a new process 
<https://source.redhat.com/groups/public/business_unit_organization>has 
been put in place for Consulting level 6 promotions that outlines clear 
promotion criteria, a nomination process for managers to submit 
nominations and a promotion panel presentation that is driven by the 
candidate. This is closely aligned with similar senior IC roles at Red 
Hat (Distinguished Engineer, Principal/Sr Principal Solutions Architect) 
and allows us to emphasize the development, the achievement and the 
overwhelming contribution of the candidates. We rolled out the initial 
phase of this process last April and promoted 3 outstanding candidates 
to Consulting level roles - Lucy Kerner, Kirsten Newcomer and Marc Curry.


Today, I am happy to announce two new Consulting level 6 promotions, 
Adrian Cambareri and Diane Mueller. Here is more information on Adrian 
and Diane:


Adrian joined Red Hat in 2014 to lead LATAM geography for the Platform 
Business unit. He led the RHEL acceleration initiatives which turned 
LATAM into one of fastest-growing geographies for Red Hat. Adrian is the 
face of RHEL BU in LATAM, regularly engaging in the customer, press, and 
analyst activities. Inside PNT and BU, he led the work on the new 
cross-functional strategy for the academic market. Adrian is also 
responsible for the evolution of the “Standardize on RHEL” sales plays 
which have been adopted globally. Most recently, he created the 
geography “pod” approach to better structure the field and BU 
collaboration, which is also now adopted globally. Adrian Cambareri is a 
true Red Hatter, role model, and mentor to people inside and outside of PNT.


Diane was first hired as an OpenShift evangelist and developer advocate 
in March 2013, to lead the OpenShift Origin community (now OKD), to 
drive usage and contributions. When we decided to pivot OpenShift to 
Kubernetes the following year, Diane helped to conceive and launch 
OpenShift Commons, to help tie together the work we were doing across 
multiple communities (kubernetes, docker, atomic, etc.) and incorporate 
all stakeholders including contributors, customers, partners and other 
end users. Since then Commons has grown to become a 700+ member 
organization, our Commons Gatherings events have drawn upwards of 1000+ 
attendees and our virtual events thousands more. This includes numerous 
customers, prospects, partners and community members to both listen and 
share their stories. Diane’s work has had a huge impact on the OpenShift 
business and has helped us grow our position and influence in the 
broader CNCF community. Diane has also been a mentor to a number of Red 
Hat employees and contributed to numerous product and marketing 
initiatives. In her role as Distinguished Community Architect, Diane 
will continue to expand the Commons community, help lead our broader 
Cloud Native community initiatives and engage directly with customers to 
drive our business.


Congratulations again to both Adrian and Diane on their well deserved 
promotions!


Thanks,

Ashesh



-------------

Ashesh Badani

Red Hat, Inc

<415.786.7366>

@asheshbadani


"When the facts change, I change my mind. What do you do?"

J M Keynes (or Samuelson)


--------------qvGd0soXBsfDXRgmbEc0h2lf
Content-Type: text/plain; charset=UTF-8; name="Attached Message Part"
Content-Disposition: attachment; filename="Attached Message Part"
Content-Transfer-Encoding: base64

LS0tLS0KClRoaXMgbGlzdCAocHJvZC1kZXB0QHJlZGhhdC5jb20pIGlzIGZvciBvZmZpY2lhbCBQ
blQgbmV3cyBhbmQgYW5ub3VuY2VtZW50cy4gRm9yd2FyZCBhbnkgY29tbWVudHMgdG8gbWVtby1s
aXN0QHJlZGhhdC5jb20gZm9yIG9wZW4gZGlzY3Vzc2lvbi4K
--------------qvGd0soXBsfDXRgmbEc0h2lf--


