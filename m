Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4B6BE6F1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 11:36:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd7Px-00030c-Pl; Fri, 17 Mar 2023 06:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=433c541ac=graf@amazon.de>)
 id 1pd7Pu-000302-Iu; Fri, 17 Mar 2023 06:34:34 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=433c541ac=graf@amazon.de>)
 id 1pd7Ps-0007jG-7y; Fri, 17 Mar 2023 06:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1679049272; x=1710585272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/zvyCPbOGbSeCVR18EHdrCT9uOTNL/enQoBwjB+3f3s=;
 b=GZXOokeq3Xlg8u2Hut/aAxqrQkelqKswoNqHW+9y5irYYPACQ8QjdMhw
 QDBY+sTCDBaUcMeMd9B+Nil/+t+ZXOD+GjT218sUY8aklxIFyWocC0bep
 NX6nBN8Mg1PU/4ynTyq4ZtE/bczSU3PFkU845ChJr/dLkx1nrjmYEIIx5 U=;
X-IronPort-AV: E=Sophos;i="5.98,268,1673913600"; d="scan'208";a="194428740"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 10:34:24 +0000
Received: from EX19MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com (Postfix)
 with ESMTPS id 2AE3340D46; Fri, 17 Mar 2023 10:34:21 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 10:34:20 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.24; Fri, 17 Mar
 2023 10:34:06 +0000
Message-ID: <63de325f-9ba1-b571-ac05-9a414e87c9cb@amazon.de>
Date: Fri, 17 Mar 2023 11:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 28/32] contrib/gitdm: add Amazon to the domain map
Content-Language: en-US
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Riku Voipio
 <riku.voipio@iki.fi>, Igor Mammedov <imammedo@redhat.com>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, Thomas Huth <thuth@redhat.com>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Hao Wu
 <wuhaotsh@google.com>, Cleber Rosa <crosa@redhat.com>, "Daniel Henrique
 Barboza" <danielhb413@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, "Aurelien
 Jarno" <aurelien@aurel32.net>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Alexandre Iooss <erdnaxe@crans.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Stafford Horne <shorne@gmail.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Sunil V L <sunilvl@ventanamicro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>, Vijai Kumar K
 <vijai@behindbytes.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "David
 Gibson" <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Niek
 Linnenbank" <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>, "Laurent
 Vivier" <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Yanan Wang
 <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, Bandan Das <bsd@redhat.com>, "Alistair
 Francis" <Alistair.Francis@wdc.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf
 <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant
 <paul@xen.org>, Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>, Peter Xu
 <peterx@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-29-alex.bennee@linaro.org>
 <387a4403ee92487d821e6f83301b08a9@amazon.co.uk>
From: Alexander Graf <graf@amazon.de>
In-Reply-To: <387a4403ee92487d821e6f83301b08a9@amazon.co.uk>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=433c541ac=graf@amazon.de; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Ck9uIDE1LjAzLjIzIDIwOjE4LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5v
cmc+Cj4+IFNlbnQ6IDE1IE1hcmNoIDIwMjMgMTc6NDMKPj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZwo+PiBDYzogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+OyBNYXJj
LUFuZHLDqSBMdXJlYXUKPj4gPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT47IHFlbXUtcmlz
Y3ZAbm9uZ251Lm9yZzsgUmlrdSBWb2lwaW8KPj4gPHJpa3Uudm9pcGlvQGlraS5maT47IElnb3Ig
TWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+OyBYaWFvIEd1YW5ncm9uZwo+PiA8eGlhb2d1
YW5ncm9uZy5lcmljQGdtYWlsLmNvbT47IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsg
V2FpbmVyIGRvcwo+PiBTYW50b3MgTW9zY2hldHRhIDx3YWluZXJzbUByZWRoYXQuY29tPjsgRHIu
IERhdmlkIEFsYW4gR2lsYmVydAo+PiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IEFsZXggV2lsbGlh
bXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+OyBIYW8KPj4gV3UgPHd1aGFvdHNoQGdv
b2dsZS5jb20+OyBDbGViZXIgUm9zYSA8Y3Jvc2FAcmVkaGF0LmNvbT47IERhbmllbCBIZW5yaXF1
ZQo+PiBCYXJib3phIDxkYW5pZWxoYjQxM0BnbWFpbC5jb20+OyBKYW4gS2lzemthIDxqYW4ua2lz
emthQHdlYi5kZT47IEF1cmVsaWVuCj4+IEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD47IHFl
bXUtYXJtQG5vbmdudS5vcmc7IE1hcmNlbG8gVG9zYXR0aQo+PiA8bXRvc2F0dGlAcmVkaGF0LmNv
bT47IEVkdWFyZG8gSGFia29zdCA8ZWR1YXJkb0BoYWJrb3N0Lm5ldD47IEFsZXhhbmRyZQo+PiBJ
b29zcyA8ZXJkbmF4ZUBjcmFucy5vcmc+OyBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT47IFBhbG1lcgo+PiBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBJbHlhIExlb3Noa2V2
aWNoIDxpaWlAbGludXguaWJtLmNvbT47IHFlbXUtCj4+IHBwY0Bub25nbnUub3JnOyBKdWFuIFF1
aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPjsgQ8OpZHJpYyBMZSBHb2F0ZXIKPj4gPGNsZ0Br
YW9kLm9yZz47IERhcnJlbiBLZW5ueSA8ZGFycmVuLmtlbm55QG9yYWNsZS5jb20+Owo+PiBrdm1A
dmdlci5rZXJuZWwub3JnOyBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWls
LmNvbT47IFBldGVyCj4+IE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IFJpY2hh
cmQgSGVuZGVyc29uCj4+IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgU3RhZmZvcmQg
SG9ybmUgPHNob3JuZUBnbWFpbC5jb20+OyBXZWl3ZWkKPj4gTGkgPGxpd2Vpd2VpQGlzY2FzLmFj
LmNuPjsgU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+OyBTdGVmYW4KPj4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHku
b3JnPjsgVmlqYWkKPj4gS3VtYXIgSyA8dmlqYWlAYmVoaW5kYnl0ZXMuY29tPjsgTGl1IFpoaXdl
aQo+PiA8emhpd2VpX2xpdUBsaW51eC5hbGliYWJhLmNvbT47IERhdmlkIEdpYnNvbgo+PiA8ZGF2
aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PjsgU29uZyBHYW8gPGdhb3NvbmdAbG9vbmdzb24uY24+
OyBQYW9sbwo+PiBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgTWljaGFlbCBTLiBUc2ly
a2luIDxtc3RAcmVkaGF0LmNvbT47IE5pZWsKPj4gTGlubmVuYmFuayA8bmlla2xpbm5lbmJhbmtA
Z21haWwuY29tPjsgR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz47IExhdXJlbnQKPj4gVml2aWVy
IDxsYXVyZW50QHZpdmllci5ldT47IFFpdWhhbyBMaSA8UWl1aGFvLkxpQG91dGxvb2suY29tPjsg
UGhpbGlwcGUKPj4gTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsgWGlhb2p1YW4g
WWFuZwo+PiA8eWFuZ3hpYW9qdWFuQGxvb25nc29uLmNuPjsgTWFobW91ZCBNYW5kb3VyIDxtYS5t
YW5kb3VyckBnbWFpbC5jb20+Owo+PiBBbGV4YW5kZXIgQnVsZWtvdiA8YWx4bmRyQGJ1LmVkdT47
IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT47Cj4+IHFlbXUtYmxvY2tAbm9u
Z251Lm9yZzsgWWFuYW4gV2FuZyA8d2FuZ3lhbmFuNTVAaHVhd2VpLmNvbT47IERhdmlkCj4+IFdv
b2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz47IHFlbXUtczM5MHhAbm9uZ251Lm9yZzsgU3Ry
YWhpbmphIEphbmtvdmljCj4+IDxzdHJhaGluamEucC5qYW5rb3ZpY0BnbWFpbC5jb20+OyBCYW5k
YW4gRGFzIDxic2RAcmVkaGF0LmNvbT47IEFsaXN0YWlyCj4+IEZyYW5jaXMgPEFsaXN0YWlyLkZy
YW5jaXNAd2RjLmNvbT47IEFsZWtzYW5kYXIgUmlrYWxvCj4+IDxhbGVrc2FuZGFyLnJpa2Fsb0Bz
eXJtaWEuY29tPjsgVHlyb25lIFRpbmcgPGtmdGluZ0BudXZvdG9uLmNvbT47IEtldmluCj4+IFdv
bGYgPGt3b2xmQHJlZGhhdC5jb20+OyBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNv
bT47IEJlcmFsZG8KPj4gTGVhbCA8YmxlYWxAcmVkaGF0LmNvbT47IEJlbmlhbWlubyBHYWx2YW5p
IDxiLmdhbHZhbmlAZ21haWwuY29tPjsgUGF1bAo+PiBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBC
aW4gTWVuZyA8YmluLm1lbmdAd2luZHJpdmVyLmNvbT47IFN1bmlsCj4+IE11dGh1c3dhbXkgPHN1
bmlsbXV0QG1pY3Jvc29mdC5jb20+OyBIYW5uYSBSZWl0eiA8aHJlaXR6QHJlZGhhdC5jb20+Owo+
PiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+OyBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+OyBHcmFmCj4+IChBV1MpLCBBbGV4YW5kZXIgPGdyYWZAYW1hem9uLmRlPjsg
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsKPj4gV29vZGhvdXNlLCBEYXZp
ZCA8ZHdtd0BhbWF6b24uY28udWs+Cj4+IFN1YmplY3Q6IFtFWFRFUk5BTF0gW1BBVENIIHYyIDI4
LzMyXSBjb250cmliL2dpdGRtOiBhZGQgQW1hem9uIHRvIHRoZQo+PiBkb21haW4gbWFwCj4+Cj4+
IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2Fu
aXphdGlvbi4gRG8gbm90Cj4+IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93Cj4+IHRoZSBjb250ZW50IGlzIHNh
ZmUuCj4+Cj4+Cj4+Cj4+IFdlIGhhdmUgbXVsdGlwbGUgY29udHJpYnV0b3JzIGZyb20gYm90aCAu
Y28udWsgYW5kIC5jb20gdmVyc2lvbnMgb2YKPj4gdGhlIGFkZHJlc3MuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPj4gQ2M6IEFsZXhh
bmRlciBHcmFmIDxncmFmQGFtYXpvbi5jb20+Cj4+IENjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+Cj4+IENjOiBEYXZpZCBXb29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4K
Pj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4KPj4gTWVzc2FnZS1JZDogPDIwMjMwMzEwMTgwMzMyLjIyNzQ4MjctNy1hbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPgo+PiAtLS0KPj4gICBjb250cmliL2dpdGRtL2RvbWFpbi1tYXAgfCAyICsrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29u
dHJpYi9naXRkbS9kb21haW4tbWFwIGIvY29udHJpYi9naXRkbS9kb21haW4tbWFwCj4+IGluZGV4
IDRhOTg4YzViNWYuLjhkY2UyNzZhMWMgMTAwNjQ0Cj4+IC0tLSBhL2NvbnRyaWIvZ2l0ZG0vZG9t
YWluLW1hcAo+PiArKysgYi9jb250cmliL2dpdGRtL2RvbWFpbi1tYXAKPj4gQEAgLTQsNiArNCw4
IEBACj4+ICAgIyBUaGlzIG1hcHMgZW1haWwgZG9tYWlucyB0byBuaWNlIGVhc3kgdG8gcmVhZCBj
b21wYW55IG5hbWVzCj4+ICAgIwo+Pgo+PiArYW1hem9uLmNvbSAgICAgIEFtYXpvbgo+PiArYW1h
em9uLmNvLnVrICAgIEFtYXpvbgo+IFlvdSBtaWdodCB3YW50ICdhbWF6b24uZGUnIHRvbyBidXQg
YXMgZmFyIGFzIGl0IGdvZXMuLi4KCgpZZXMsIHBsZWFzZSBhZGQgYW1hem9uLmRlIGhlcmUuIE9u
Y2UgdGhhdCdzIGFkZGVkLCBmZWVsIGZyZWUgdG8gdGFrZSBteQoKUmV2aWV3ZWQtYnk6IEFsZXhh
bmRlciBHcmFmIDxncmFmQGFtYXpvbi5jb20+CgoKQWxleAoKCgoKCkFtYXpvbiBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFl
ZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


