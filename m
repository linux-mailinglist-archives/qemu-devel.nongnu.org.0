Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F3493DF9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:08:06 +0100 (CET)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADVE-0005JE-CW
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:08:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frederic@fr.ibm.com>)
 id 1nACcw-0008Os-LY; Wed, 19 Jan 2022 10:12:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9954
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frederic@fr.ibm.com>)
 id 1nACcb-0004su-Qt; Wed, 19 Jan 2022 10:11:40 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JDXV9D014715; 
 Wed, 19 Jan 2022 15:11:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dpkmsjgpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 15:11:13 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20JEoq3H014159;
 Wed, 19 Jan 2022 15:11:12 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dpkmsjgnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 15:11:12 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JF95G6026430;
 Wed, 19 Jan 2022 15:11:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3dknwanqju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 15:11:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20JFB82S42402066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 15:11:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68FAB52059;
 Wed, 19 Jan 2022 15:11:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 188655204E;
 Wed, 19 Jan 2022 15:11:08 +0000 (GMT)
Received: from kin.tlslab.ibm.com (kin.tlslab.ibm.com [9.101.18.11])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D5F362200E5;
 Wed, 19 Jan 2022 16:11:07 +0100 (CET)
Received: by kin.tlslab.ibm.com (Postfix, from userid 1000)
 id BAE122C40F51; Wed, 19 Jan 2022 16:11:07 +0100 (CET)
Date: Wed, 19 Jan 2022 16:10:55 +0100
Message-ID: <20220119161055.GJ2065267@kin.tlslab.ibm.com>
From: =?UTF-8?B?RnLDqWTDqXJpYw==?= Bonnard <frediz@debian.org>
To: =?UTF-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
In-Reply-To: <aa2c9a5c-6832-f5f6-1af3-6a306ea90d4f@kaod.org>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
 <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
 <89f6b051-2d7d-02cf-6de2-b1065bb5696b@ilande.co.uk>
 <8f70fc45-1f2f-ce23-f95e-cb4f8ac53ab9@kaod.org>
 <e5c47ed6-f197-548d-e55c-cb07a59d019d@ilande.co.uk>
 <aa2c9a5c-6832-f5f6-1af3-6a306ea90d4f@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="M3J6aqtKSQnaGEV1";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QgiYBCA3zvt2BQv9f0XDbDDkcjTpF9L_
X-Proofpoint-ORIG-GUID: L8Z062nQXb6Ouzxoa4vcojYJGE7F4A7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_08,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1011 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frederic@fr.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Jan 2022 10:17:30 -0500
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--M3J6aqtKSQnaGEV1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCkkgbWFpbmx5IGZvY3VzIG9uICdwcGM2NGVsJyBvbiB3aGljaCBEZWJpYW4gMTEgaW5zdGFs
bHMgd2VsbC4KSSdtIHByZXR0eSBzdXJlIEkndmUgbm90IHRyaWVkIERlYmlhbiAxMSBvbiAncHBj
NjQnIChpLmUuIGJlKSB3aXRoIHFlbXUuCkV2ZW4gbGVzcyBvbiAncG93ZXJwYycgKGkuZS4gMzJi
KS4KTm93IEkga25vdyB0aGF0IHBvd2VycGMgaGFzIGEgZGlmZmVyZW50IGJvb3Rsb2FkZXIgaW5z
dGFsbGF0aW9uIHByb2Nlc3MKY29tcGFyZWQgdG8gcHBjNjQqIGluIERlYmlhbiwgYnV0IGl0J3Mg
Y29udmVyZ2luZyByZWNlbnRseSBhdCB0aGUgRGViaWFuCmluc3RhbGxlciBsZXZlbC4KCkNvdWxk
IHlvdSBndXlzIHNlbmQgZGV0YWlscyB0byBkZWJpYW4tcG93ZXJwY0BsaXN0cy5kZWJpYW4ub3Jn
IHNvIHRoYXQKbWUgb3Igb3RoZXJzIChtb3JlICdwb3dlcnBjJyBhbmQgJ3BwYzY0JyBkZXYvdXNl
cnMpIGNhbiBoYXZlIGEgbG9vayA/CgpGLgoKCk9uIFR1ZSwgMTggSmFuIDIwMjIgMTA6MTI6NDYg
KzAxMDAgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4gWyBBZGRpbmcg
RnJlZCBdCj4gCj4gT24gMS8xOC8yMiAwOTozMCwgTWFyayBDYXZlLUF5bGFuZCB3cm90ZToKPiA+
IE9uIDE3LzAxLzIwMjIgMTQ6NTIsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+ID4gCj4gPj4g
SW5pdGlhbGx5LCBJIGluc3RhbGxlZCBhIGRlYmlhbjExIHBwYzY0IG9uIGEgUUVNVSBtYWM5OS85
NzAgbWFjaGluZS4KPiA+PiBTb21ldGhpbmcgd2VudCB3cm9uZyB3aXRoIHRoZSBib290bG9hZGVy
IGF0IGluc3RhbGxhdGlvbiBhbmQgSSB3YXMKPiA+PiBzdHVjayB3aXRoIG1lbW9yeSBib290LiBJ
IGRpZG4ndCBtYW5hZ2UgdG8gcmVzdG9yZSBhIGRlY2VudCBib290Cj4gPj4gc2V0dXAgZXZlbiBh
ZnRlciB0aGF0Lgo+ID4gCj4gPiBJbnRlcmVzdGluZy4gSSBoYWQgYSBzaW1pbGFyIGlzc3VlIHVz
aW5nIHRoZSBkZWJpYW4gcG9ydHMgaW1hZ2VzIG9uIG1hYzk5L3BwYzMyOiBldmVyeXRoaW5nIHdl
bnQgd2VsbCBhbGwgdXAgdW50aWwgdGhlIGJvb3Rsb2FkZXIgaW5zdGFsbGF0aW9uIHdoaWNoIGZh
aWxlZC4gV2hlbiBJIGxvb2tlZCBhdCB0aGUgaW5zdGFsbGVyIGxvZ3MgSUlSQyB0aGVyZSB3YXMg
YSBrZXJuZWwgcGFuaWMgc29tZXdoZXJlIGluIHRoZSBoZnMgbW9kdWxlIHdoaWNoIEkgZmlndXJl
ZCBpcyBsaWtlbHkgYW4gZW11bGF0aW9uIGJ1ZyBzb21ld2hlcmUuCj4gCj4gSXMgdGhhdCBhIGtu
b3duIGlzc3VlID8gSSBndWVzcyB0aGVzZSBpbnN0YWxsIGNvbmZpZ3MgYXJlIG5vdCBvZnRlbgo+
IHRlc3RlZC4KPiAKPiBUaGFua3MsCj4gCj4gQy4KPiAKPiAK

--M3J6aqtKSQnaGEV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUcNLaNDnm9KixdycT/iCOjpV/RkFAmHoKf8ACgkQT/iCOjpV
/RnyOg//eIRyFczHpPvvZ9bhaFl1vYzVRa9NRJ7014uu5hbL5mYMpPSHuJwe2wS6
v2Q87W/96y24fEI2lc5L22vCQsCxdkpz1FeUIixYrc7/KQZxW430O7GrFVAh2Pqd
xRWdFECZNNWCL180/SNEnLmzgm8RzqILOJMywrrBWEhpwK2tzdxAT1MjIsG7pG/U
qOik16mSa2/GPhWzQMwp/OxxHXe658Bs0daPieoQu3FmAh8QfqFh5w2caBaCyprG
wboQ0MfG+DFFAdfSBYLilcqbec8aAUcMIazKWhNiq8ySx8EebyBcxbLMRq6WaHCe
OzWYpl80AqPe7YtUg5nKHcjkwUJMxy6R8SMt8oyu2aFH1RpGe4B28pdR4sKOYByu
OKcF4vEMeuMyKuO8hcsglibjXf85n1mCWhD9yRgHMhMe94ugYghxh+UPZgNKpBwh
kwj7vGkmf83ZTtuL2HqGbcl/u9yOFeVPibEVudZnQL+350or1615cRIeTVZGxrcK
WU1a1Cz26ctJBCoSiaQEaK1ZLg0mVTez/gegsZGZrlGTCrkvcM8cijqLWXTWwC2f
o/ZkYHXQOQs6WC1L9gMCjcsrzJSHkSasB7I6Kai9S5jbQOzFz21ZOGJ8RKeYgPYB
TDT1io9Tkur5dmnpdJdcHhKi+BHutSphlJP3gfqnzVUnd4JsbDU=
=yis0
-----END PGP SIGNATURE-----

--M3J6aqtKSQnaGEV1--


