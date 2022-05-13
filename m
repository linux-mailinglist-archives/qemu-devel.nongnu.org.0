Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0A5261CF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:27:33 +0200 (CEST)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUOJ-0007ax-UB
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1npTua-0005gy-Jc
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1npTuX-0001zH-1j
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652443003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v12GgvoOxkiqX8GBfbrBnSm+aw9atvfXVEl8miNpYXE=;
 b=VZMdOZYkU/N+lyB7lH1/pfQ44etSOmRcn3bTtfy9FcztAPXrfGj09iOpjwspjKuIwGSXD7
 i47Jqg6miWOSR+0fKOyTWbgc13vQPdCEMivl71gVUhp03HOcO/HheI3TcRV4eOL6ss7Dpl
 SpTuy/YD5kpeEnbr0L23D+NzdK0JxGI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-vo3ZpCEeP_6v_yUI4QFtXw-1; Fri, 13 May 2022 07:56:42 -0400
X-MC-Unique: vo3ZpCEeP_6v_yUI4QFtXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so2961040wmj.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 04:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=v12GgvoOxkiqX8GBfbrBnSm+aw9atvfXVEl8miNpYXE=;
 b=Wi/bOL0SjUq3SX43Ww8HUwjowSjMsk3OUSOstFJlZf66KNaNBbwEJfEHGFpH0NmlAP
 0hReqdL/pfavO+L0B+bLSr3NrGXbJ3CfBpa9IceyVyDSmyC0yPWMQb0lA7r8SqB6yM9t
 vv5dzmyx+0wnUp5D1Va6hTO2C9lBAqE98yzOsJjbBORNuWOZLZrycJ0MkW6Y5741gOPG
 8wMNAk7wt6DtPPgnEF5rPlngOGL4xtrTYZNIi0X6EnpknkZCHbLJnRZrSIM54RCOvRRu
 SBebcfByZVCb0DvfSIq8lzeV3BEI8GNlmi2SGFlY7VZOeOxJZ/LXX9oHYY9v9/HgIrz0
 bn0A==
X-Gm-Message-State: AOAM531OZXYlCkJ5JoojjOgXl+37UKIdvzKiy9uG4sry5aD9nDofHTLv
 xLxua26GnVHEdX5mGIvYCicGBBWEU1BARaIqwUmuD7POXT+24V61thl34azIlrjWmaVLdvNDUf5
 deDVd+u65Wt4t9Cs=
X-Received: by 2002:a05:6000:18a2:b0:20c:6d0d:10b0 with SMTP id
 b2-20020a05600018a200b0020c6d0d10b0mr3693500wri.345.1652443000789; 
 Fri, 13 May 2022 04:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFELL5ILJiMm0A53CNzBZu2pyoTuu1Jc01bqyI3Aa+y5e6BqFzBCYGjqMsErWYwcfBEZFT4A==
X-Received: by 2002:a05:6000:18a2:b0:20c:6d0d:10b0 with SMTP id
 b2-20020a05600018a200b0020c6d0d10b0mr3693478wri.345.1652443000514; 
 Fri, 13 May 2022 04:56:40 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:be0e:91f7:c0a3:32f0?
 ([2a0c:5a80:1306:2f00:be0e:91f7:c0a3:32f0])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2315991wrh.99.2022.05.13.04.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:56:40 -0700 (PDT)
Message-ID: <dd8c888aac88b0fd70ee5a73cf9dca3406efe606.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] thread-pool: replace semaphore with condition
 variable
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Luk=C3=A1=C5=A1?= Doktor
 <ldoktor@redhat.com>
Date: Fri, 13 May 2022 13:56:39 +0200
In-Reply-To: <20220512104346.865536-3-pbonzini@redhat.com>
References: <20220512104346.865536-1-pbonzini@redhat.com>
 <20220512104346.865536-3-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGFvbG8sCgpPbiBUaHUsIDIwMjItMDUtMTIgYXQgMTI6NDMgKzAyMDAsIFBhb2xvIEJvbnpp
bmkgd3JvdGU6CgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvdXRpbC90aHJlYWQtcG9vbC5jIGIvdXRp
bC90aHJlYWQtcG9vbC5jCj4gaW5kZXggNDk3OWYzMGNhMy4uZGExODlkOTMzOCAxMDA2NDQKPiAt
LS0gYS91dGlsL3RocmVhZC1wb29sLmMKPiArKysgYi91dGlsL3RocmVhZC1wb29sLmMKPiBAQCAt
NTcsNyArNTcsNyBAQCBzdHJ1Y3QgVGhyZWFkUG9vbCB7Cj4gwqDCoMKgwqAgUUVNVUJIICpjb21w
bGV0aW9uX2JoOwo+IMKgwqDCoMKgIFFlbXVNdXRleCBsb2NrOwo+IMKgwqDCoMKgIFFlbXVDb25k
IHdvcmtlcl9zdG9wcGVkOwo+IC3CoMKgwqAgUWVtdVNlbWFwaG9yZSBzZW07Cj4gK8KgwqDCoCBR
ZW11Q29uZCByZXF1ZXN0X2NvbmQ7Cj4gwqDCoMKgwqAgUUVNVUJIICpuZXdfdGhyZWFkX2JoOwo+
IMKgCj4gwqDCoMKgwqAgLyogVGhlIGZvbGxvd2luZyB2YXJpYWJsZXMgYXJlIG9ubHkgYWNjZXNz
ZWQgZnJvbSBvbmUKPiBBaW9Db250ZXh0LiAqLwo+IEBAIC03NCwyMyArNzQsNiBAQCBzdHJ1Y3Qg
VGhyZWFkUG9vbCB7Cj4gwqDCoMKgwqAgaW50IG1heF90aHJlYWRzOwo+IMKgfTsKPiDCoAo+IC1z
dGF0aWMgaW5saW5lIGJvb2wgYmFja190b19zbGVlcChUaHJlYWRQb29sICpwb29sLCBpbnQgcmV0
KQo+IC17Cj4gLcKgwqDCoCAvKgo+IC3CoMKgwqDCoCAqIFRoZSBzZW1hcGhvcmUgdGltZWQgb3V0
LCB3ZSBzaG91bGQgZXhpdCB0aGUgbG9vcCBleGNlcHQgd2hlbjoKPiAtwqDCoMKgwqAgKsKgIC0g
VGhlcmUgaXMgd29yayB0byBkbywgd2UgcmFjZWQgd2l0aCB0aGUgc2lnbmFsLgo+IC3CoMKgwqDC
oCAqwqAgLSBUaGUgbWF4IHRocmVhZHMgdGhyZXNob2xkIGp1c3QgY2hhbmdlZCwgd2UgcmFjZWQg
d2l0aCB0aGUKPiBzaWduYWwuCj4gLcKgwqDCoMKgICrCoCAtIFRoZSB0aHJlYWQgcG9vbCBmb3Jj
ZXMgYSBtaW5pbXVtIG51bWJlciBvZiByZWFkaWx5Cj4gYXZhaWxhYmxlIHRocmVhZHMuCj4gLcKg
wqDCoMKgICovCj4gLcKgwqDCoCBpZiAocmV0ID09IC0xICYmICghUVRBSUxRX0VNUFRZKCZwb29s
LT5yZXF1ZXN0X2xpc3QpIHx8Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9vbC0+Y3VyX3Ro
cmVhZHMgPiBwb29sLT5tYXhfdGhyZWFkcyB8fAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBv
b2wtPmN1cl90aHJlYWRzIDw9IHBvb2wtPm1pbl90aHJlYWRzKSkgewo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiB0cnVlOwo+IC3CoMKgwqAgfQo+IC0KPiAtwqDCoMKgIHJldHVybiBm
YWxzZTsKPiAtfQo+IC0KPiDCoHN0YXRpYyB2b2lkICp3b3JrZXJfdGhyZWFkKHZvaWQgKm9wYXF1
ZSkKPiDCoHsKPiDCoMKgwqDCoCBUaHJlYWRQb29sICpwb29sID0gb3BhcXVlOwo+IEBAIC05OSwy
MCArODIsMjcgQEAgc3RhdGljIHZvaWQgKndvcmtlcl90aHJlYWQodm9pZCAqb3BhcXVlKQo+IMKg
wqDCoMKgIHBvb2wtPnBlbmRpbmdfdGhyZWFkcy0tOwo+IMKgwqDCoMKgIGRvX3NwYXduX3RocmVh
ZChwb29sKTsKPiDCoAo+IC3CoMKgwqAgd2hpbGUgKCFwb29sLT5zdG9wcGluZykgewo+ICvCoMKg
wqAgd2hpbGUgKCFwb29sLT5zdG9wcGluZyAmJiBwb29sLT5jdXJfdGhyZWFkcyA8PSBwb29sLQo+
ID5tYXhfdGhyZWFkcykgewo+IMKgwqDCoMKgwqDCoMKgwqAgVGhyZWFkUG9vbEVsZW1lbnQgKnJl
cTsKPiDCoMKgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqAgZG8g
ewo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoUVRBSUxRX0VNUFRZKCZwb29sLT5yZXF1ZXN0X2xpc3Qp
KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvb2wtPmlkbGVfdGhyZWFkcysrOwo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHFlbXVfbXV0ZXhfdW5sb2NrKCZwb29sLT5sb2NrKTsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBxZW11X3NlbV90aW1lZHdhaXQoJnBvb2wtPnNl
bSwgMTAwMDApOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHFlbXVfbXV0ZXhfbG9jaygmcG9v
bC0+bG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcWVtdV9jb25kX3RpbWVk
d2FpdCgmcG9vbC0+cmVxdWVzdF9jb25kLCAmcG9vbC0KPiA+bG9jaywgMTAwMDApOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwb29sLT5pZGxlX3RocmVhZHMtLTsKPiAtwqDCoMKgwqDCoMKg
wqAgfSB3aGlsZSAoYmFja190b19zbGVlcChwb29sLCByZXQpKTsKPiAtwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCA9PSAtMSB8fCBwb29sLT5zdG9wcGluZyB8fAoKSSB0aGluaywgeW91IG5lZWQgdG8g
Y2hlY2sgZm9yICdwb29sLT5zdG9wcGluZycgdXBvbiBleGl0aW5nIHdhaXRfY29uZCgpLgpPdGhl
cndpc2UgaXQnbGwgYmxpbmRseSB0cnkgdG8gZGVxdWV1ZSBhIHJlcXVlc3QgZnJvbSBhIGxpc3Qg
dGhhdCBpcyBvdGhlcndpc2UKZW1wdHkuCgpCVFcsIEkgc2VlIHRoZXJlIGlzIG5vIHRocmVhZF9w
b29sX2ZyZWUoKSB1bml0IHRlc3QuCgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvb2wtPmN1
cl90aHJlYWRzID4gcG9vbC0+bWF4X3RocmVhZHMpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0ID09IDApIHsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChRVEFJTFFfRU1QVFkoJnBvb2wtPnJlcXVl
c3RfbGlzdCkgJiYKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9v
bC0+Y3VyX3RocmVhZHMgPiBwb29sLT5taW5fdGhyZWFkcykgewo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBUaW1lZCBvdXQgKyBubyB3b3JrIHRvIGRvICsgbm8g
bmVlZCBmb3Igd2FybQo+IHRocmVhZHMgPSBleGl0LsKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEV2ZW4gaWYg
dGhlcmUgaXMgc29tZSB3b3JrIHRvIGRvLCBjaGVjayBpZgo+IHRoZXJlIGFyZW4ndAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdG9vIG1hbnkgd29ya2VyIHRo
cmVhZHMgYmVmb3JlIHBpY2tpbmcgaXQgdXAuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoCByZXEgPSBRVEFJTFFfRklSU1QoJnBvb2wtPnJlcXVlc3RfbGlzdCk7Cj4gQEAgLTIy
OSwxMyArMjE5LDcgQEAgc3RhdGljIHZvaWQgdGhyZWFkX3Bvb2xfY2FuY2VsKEJsb2NrQUlPQ0Ig
KmFjYikKPiDCoMKgwqDCoCB0cmFjZV90aHJlYWRfcG9vbF9jYW5jZWwoZWxlbSwgZWxlbS0+Y29t
bW9uLm9wYXF1ZSk7Cj4gwqAKPiDCoMKgwqDCoCBRRU1VX0xPQ0tfR1VBUkQoJnBvb2wtPmxvY2sp
Owo+IC3CoMKgwqAgaWYgKGVsZW0tPnN0YXRlID09IFRIUkVBRF9RVUVVRUQgJiYKPiAtwqDCoMKg
wqDCoMKgwqAgLyogTm8gdGhyZWFkIGhhcyB5ZXQgc3RhcnRlZCB3b3JraW5nIG9uIGVsZW0uIHdl
IGNhbiB0cnkgdG8KPiAic3RlYWwiCj4gLcKgwqDCoMKgwqDCoMKgwqAgKiB0aGUgaXRlbSBmcm9t
IHRoZSB3b3JrZXIgaWYgd2UgY2FuIGdldCBhIHNpZ25hbCBmcm9tIHRoZQo+IC3CoMKgwqDCoMKg
wqDCoMKgICogc2VtYXBob3JlLsKgIEJlY2F1c2UgdGhpcyBpcyBub24tYmxvY2tpbmcsIHdlIGNh
biBkbyBpdAo+IHdpdGgKPiAtwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBsb2NrIHRha2VuIGFuZCBl
bnN1cmUgdGhhdCBlbGVtIHdpbGwgcmVtYWluCj4gVEhSRUFEX1FVRVVFRC4KPiAtwqDCoMKgwqDC
oMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoCBxZW11X3NlbV90aW1lZHdhaXQoJnBvb2wtPnNl
bSwgMCkgPT0gMCkgewo+ICvCoMKgwqAgaWYgKGVsZW0tPnN0YXRlID09IFRIUkVBRF9RVUVVRUQp
IHsKPiDCoMKgwqDCoMKgwqDCoMKgIFFUQUlMUV9SRU1PVkUoJnBvb2wtPnJlcXVlc3RfbGlzdCwg
ZWxlbSwgcmVxcyk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBxZW11X2JoX3NjaGVkdWxlKHBvb2wtPmNv
bXBsZXRpb25fYmgpOwoKClRoZSAndGhyZWFkLXBvb2wgY2FuY2VsJyB1bml0IHRlc3QgZmFpbHMu
CgpJIHRoaW5rIGl0J3MgYmVjYXVzZSB0aGVyZSBpcyBhbiBhc3N1bXB0aW9uIGluIHdvcmtlcl90
aHJlYWQoKSB0aGF0IGlmIHlvdSBnZXQKd29rZW4gdXAsIHlvdSdsbCBoYXZlIGEgcGVuZGluZyBy
ZXF1ZXN0LiBBbmQgeW91J3JlIG5vdyAnc3RlYWxpbmcnIHdvcmsKcmVxdWVzdHMsIHdpdGhvdXQg
J3N0ZWFsaW5nJyBhIHdha2V1cCAod2hhdCBxZW11X3NlbV90aW1lZHdhaXQoc2VtLCAwKSBhY2hp
ZXZlZAppbiB0aGUgcGFzdCkuCgpSZWdhcmRzLAoKLS0gCk5pY29sw6FzIFPDoWVuego=


