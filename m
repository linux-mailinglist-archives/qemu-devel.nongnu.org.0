Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776CC4F09DD
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 15:17:40 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nb06t-0001jp-3s
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 09:17:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1nb04f-00013N-UR
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 09:15:27 -0400
Received: from redisdead.crans.org ([185.230.79.39]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1nb04Y-0005ts-G5
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 09:15:17 -0400
Received: from [IPV6:2a02:8428:4db:b001:2da1:28b8:3745:ec97]
 (2a02-8428-04db-b001-2da1-28b8-3745-ec97.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:2da1:28b8:3745:ec97])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 7CC10204;
 Sun,  3 Apr 2022 15:14:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1648991692; bh=yPFRX4joWxMqddmuIKibUvnVqPH0bHpk+p7lTHgfUe0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zi1iZtq0PDx7kBU9kvCO2ZC+xGpM/KnWPRuqSRFpkWeG50iWBVNVIFY+hD2IBgEta
 B/bcRpd7Q0Db5Tiyv4exhwQVUYBbi6gJoZMSeDsU9KWPEhJeD2ZlGP3A2yCi05gAVZ
 E6c9G6oUX0vLkznzTvlKjRx+brlF6I87AwdVaAD+ClMNJJ7VWcoITFNN3lPQwDg6bq
 X36vSe8RbJOKRTFbyRosHAF24ecODgbxxWp4H6GnoBPFY2pW1C2Crhu9VYMs5PRfem
 Baps3XD+7RQ4aWrRusaC9dR/ABRRROnwOrrEm6RlRsjhGTfFs9qK8d1RIjkUn+OGm6
 uLv1hGlgsZVV+I654fOP7DAj0BVyCgeTY+deF+BB4zweiUkl9d/LMWElvFj9O3L/Q6
 R/LLgkzaP1WSb7/HM+WPTfwUD6jy2jdC+sDqwOPMczq0o9a2K30Pc4coGHfp8KfPGs
 atFIqDMh5H8GAmZfa2v3y9nLuXDiW5NOPkfttePC85pjlw5WfEMaOJ8RwPz62Pb9f1
 LrYLp9leVXIFoLzvxRt/V4L3CaUh/uY8TkwFLRx4orPb+OQtTsVlg+RazvHwBILawD
 cSiHuZmnrslNU3mhkDhCIuLljmD4EeASNCtJHvDKri78yYDUNOWtuVWFQO8s/uBUqs
 /ADjsqoARcpRMBu3ug1ZX0HQ=
Message-ID: <660f1295-73dd-ba1f-5a95-094ccdbd2de3@crans.org>
Date: Sun, 3 Apr 2022 15:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/2] plugins: extend execlog to filter matches
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220328152614.2452259-1-alex.bennee@linaro.org>
 <20220328152614.2452259-3-alex.bennee@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
In-Reply-To: <20220328152614.2452259-3-alex.bennee@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1GvwnhHrF9o1rLt8hEd48J20"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1GvwnhHrF9o1rLt8hEd48J20
Content-Type: multipart/mixed; boundary="------------jUyCC09it0i0dUynHNxZLyfs";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Message-ID: <660f1295-73dd-ba1f-5a95-094ccdbd2de3@crans.org>
Subject: Re: [PATCH v1 2/2] plugins: extend execlog to filter matches
References: <20220328152614.2452259-1-alex.bennee@linaro.org>
 <20220328152614.2452259-3-alex.bennee@linaro.org>
In-Reply-To: <20220328152614.2452259-3-alex.bennee@linaro.org>

--------------jUyCC09it0i0dUynHNxZLyfs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAzLzI4LzIyIDE3OjI2LCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFNvbWV0aW1lcyB0
aGUgd2hvbGUgZXhlY2xvZyBpcyBqdXN0IHR3byBtdWNoIHNvIGFkZCB0aGUgYWJpbGl0eSB0
bw0KPiBmaWx0ZXIgYnkgaW5zdHJ1Y3Rpb24gb3Bjb2RlIG9yIGFkZHJlc3MuDQo+IA0KPiBb
QUpCOiB0aGlzIHNob3dzIGZvciBleGFtcGxlDQo+IA0KPiAgIC5xZW11LXN5c3RlbS1hYXJj
aDY0IC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBtb246c3RkaW8gXA0KPiAgICAgLU0gdmlydCAt
Y3B1IG1heCBcDQo+ICAgICAtc2VtaWhvc3RpbmctY29uZmlnIGVuYWJsZT1vbiBcDQo+ICAg
ICAta2VybmVsIC4vdGVzdHMvdGNnL2FhcmNoNjQtc29mdG1tdS9tZW1vcnktc3ZlIFwNCj4g
ICAgIC1wbHVnaW4gLi9jb250cmliL3BsdWdpbnMvbGliZXhlY2xvZy5zbyxpZmlsdGVyPXN0
MXcsYWZpbHRlcj0weDQwMDAxODA4IC1kIHBsdWdpbiAtRCBwbHVnaW4ub3V0DQo+IA0KPiB0
aGUgc3QxdyBTVkUgaW5zdHJ1Y3Rpb24gaXMgbm90IGluc3RydW1lbnRpbmcgaXRzIHN0b3Jl
cy5dDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+DQo+IENjOiBSb2JlcnQgSGVucnkgPHJvYmhlbnJ5QG1pY3Jvc29mdC5jb20+
DQo+IENjOiBBYXJvbiBMaW5kc2F5IDxhYXJvbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0K
DQpUaGFua3MhDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgSW9vc3MgPGVyZG5heGVAY3Jh
bnMub3JnPg0KDQotLSANCkFsZXhhbmRyZQ0K

--------------jUyCC09it0i0dUynHNxZLyfs--

--------------1GvwnhHrF9o1rLt8hEd48J20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmJJnckFAwAAAAAACgkQbHknjz/NzALM
zBAAsh4rzb+2kjsezxu3cDrbMclT6AuP8bD1i/ViLd6o5vIIvs/EZTe4ztQDXq9OonbxwEGpE2Qb
dkss1aCJ8cyA7UjOioaDCZUny3NwucA4DDA7TeyHdRvLKeFG02FEPV409gCA49Z2zFrfxMOZC4kU
/RZxVIh4Qk78U9kZJZPmauS2HyU7rJxcHemUkLexTSBgRD96ujEg1zkOvAh65Rw5RzMuEVajep+e
KR8YgXFG5vKl2vX7LS0+4ENVT1w78mzedJugUcsWhcULJCXHfWx/G6cGA6CK2rbAWB/78zcv4XsB
CXYzPI7LUbXMkJHRb9elOTjT89yN8qR30YxgDVJFlnxdSttJUmhswJfpjZLYS6CH2CPDPwTJfJE7
rUoEcCYM5q2GebVuU4pHFN5ibXhFwDZIhfPczIiyXPfpBrbR4gMN7BHWJCnT3/qfaKGNmxPOh10z
xX+YTbShLQuyx5uK9iU6R6uFqDPyAUcbidF8iGGv30Nsayy6RSEQXYhnzuV4YY5JC3AwZ0zzt0gQ
vkYjU6nlVD7CTXsK70sRJkvE5lzn55QDSGOJ4QjBlrpJUqcxXJYwiUnr89oiZxIalRlSKjjZYp5w
aPesza2K3cw8vqZA3L32Yr8fWlyvD8gsc98xwCB5t5GmVSWvWuuNPlHDE37BalI/uiZaGQbfdUqR
0Iw=
=B+31
-----END PGP SIGNATURE-----

--------------1GvwnhHrF9o1rLt8hEd48J20--

