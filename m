Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E84053965A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:37:42 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6kP-0006sV-E9
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nw6Ef-0003Dg-8X; Tue, 31 May 2022 14:04:53 -0400
Received: from [187.72.171.209] (port=1497 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nw6Ed-0003hZ-3T; Tue, 31 May 2022 14:04:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 31 May 2022 15:04:40 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 98AB4800094;
 Tue, 31 May 2022 15:04:39 -0300 (-03)
Message-ID: <3b96fc19-8857-8a63-8ab0-5f37ef1177ce@eldorado.org.br>
Date: Tue, 31 May 2022 15:04:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 mopsfelder@gmail.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220531172711.94564-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 31 May 2022 18:04:40.0445 (UTC)
 FILETIME=[E5EA92D0:01D87518]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

T24gMzEvMDUvMjAyMiAxNDoyNywgTXVyaWxvIE9wc2ZlbGRlciBBcmF1am8gd3JvdGU6DQo+
IFVwZGF0ZSBtYXggYWxpYXMgdG8gcG93ZXIxMCBzbyB1c2VycyBjYW4gdGFrZSBhZHZhbnRh
Z2Ugb2YgYSBtb3JlDQo+IHJlY2VudCBDUFUgbW9kZWwgd2hlbiAnLWNwdSBtYXgnIGlzIHBy
b3ZpZGVkLg0KPiANCj4gUmVzb2x2ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2pl
Y3QvcWVtdS8tL2lzc3Vlcy8xMDM4DQo+IENjOiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPg0KPiBDYzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+
DQo+IENjOiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPiBDYzogRGFuaWVs
IEhlbnJpcXVlIEJhcmJvemEgPGRhbmllbGhiNDEzQGdtYWlsLmNvbT4NCj4gQ2M6IEZhYmlh
bm8gUm9zYXMgPGZhcm9zYXNAbGludXguaWJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTXVy
aWxvIE9wc2ZlbGRlciBBcmF1am8gPG11cmlsb29AbGludXguaWJtLmNvbT4NCj4gLS0tDQo+
ICAgdGFyZ2V0L3BwYy9jcHUtbW9kZWxzLmMgfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
YXJnZXQvcHBjL2NwdS1tb2RlbHMuYyBiL3RhcmdldC9wcGMvY3B1LW1vZGVscy5jDQo+IGlu
ZGV4IDk3NmJlNWUwZDEuLmMxNWZjYjQzYTEgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9wcGMv
Y3B1LW1vZGVscy5jDQo+ICsrKyBiL3RhcmdldC9wcGMvY3B1LW1vZGVscy5jDQo+IEBAIC04
NzksNyArODc5LDYgQEAgUG93ZXJQQ0NQVUFsaWFzIHBwY19jcHVfYWxpYXNlc1tdID0gew0K
PiAgICAgICB7ICI3NTUiLCAiNzU1X3YyLjgiIH0sDQo+ICAgICAgIHsgImdvbGRmaW5nZXIi
LCAiNzU1X3YyLjgiIH0sDQo+ICAgICAgIHsgIjc0MDAiLCAiNzQwMF92Mi45IiB9LA0KPiAt
ICAgIHsgIm1heCIsICI3NDAwX3YyLjkiIH0sDQo+ICAgICAgIHsgImc0IiwgICI3NDAwX3Yy
LjkiIH0sDQo+ICAgICAgIHsgIjc0MTAiLCAiNzQxMF92MS40IiB9LA0KPiAgICAgICB7ICJu
aXRybyIsICI3NDEwX3YxLjQiIH0sDQo+IEBAIC05MTAsNiArOTA5LDggQEAgUG93ZXJQQ0NQ
VUFsaWFzIHBwY19jcHVfYWxpYXNlc1tdID0gew0KPiAgICAgICB7ICJwb3dlcjhudmwiLCAi
cG93ZXI4bnZsX3YxLjAiIH0sDQo+ICAgICAgIHsgInBvd2VyOSIsICJwb3dlcjlfdjIuMCIg
fSwNCj4gICAgICAgeyAicG93ZXIxMCIsICJwb3dlcjEwX3YyLjAiIH0sDQo+ICsgICAgLyog
VXBkYXRlIHRoZSAnbWF4JyBhbGlhcyB0byB0aGUgbGF0ZXN0IENQVSBtb2RlbCAqLw0KPiAr
ICAgIHsgIm1heCIsICJwb3dlcjEwX3YyLjAiIH0sDQo+ICAgI2VuZGlmDQo+IA0KPiAgICAg
ICAvKiBHZW5lcmljIFBvd2VyUENzICovDQo+IC0tDQo+IDIuMzYuMQ0KPiANCj4gDQoNCkhp
IE11cmlsbywNCg0KSSBndWVzcyB3ZSBuZWVkIGEgIm1heCIgZm9yIHFlbXUtc3lzdGVtLXBw
YyB0b28sIHNvIG1heWJlIHNvbWV0aGluZyBsaWtlDQoNCiA+ICAgICAvKiBVcGRhdGUgdGhl
ICdtYXgnIGFsaWFzIHRvIHRoZSBsYXRlc3QgQ1BVIG1vZGVsICovDQogPiAjaWYgZGVmaW5l
ZChUQVJHRVRfUFBDNjQpDQogPiAgICAgeyAibWF4IiwgInBvd2VyMTBfdjIuMCIgfSwNCiA+
ICNlbHNlDQogPiAgICAgeyAibWF4IiwgIjc0NTdhX3YxLjIiIH0sDQogPiAjZW5kaWYNCg0K
T3Igc29tZSBvdGhlciBDUFUgd2hpY2ggaXMgY29uc2lkZXJlZCB0aGUgbWF4IGZvciAzMi1i
aXQuLi4NCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEg
ZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxk
b3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

