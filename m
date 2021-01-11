Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252A2F0B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:22:06 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kynmP-0002dn-8P
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kynjx-00027d-8O
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:19:33 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kynju-0007s3-S4
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:19:32 -0500
Received: by mail-pl1-x635.google.com with SMTP id r4so8758293pls.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 19:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wataash-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/jn32dDeM8C7WaNEnqpZJIQkb09OTkglE0Ep6+m7bAc=;
 b=iaNH+g63OVrJKwXfYTSfuDyaunFjQjheYIcYgRhzp8JWzkRFm0Lz6JH7xGyOXUgUQp
 +bCM0Fg/s9af2oP6mgvfCCyXKinSz8JUaU7VTXVN8cZZxBpVzpri1M3DHILZXWHiC4op
 EOjteoxoms0xfFsC4bNE/SC5bTR93aCknYKiGk1aDxqkU+AI5EtYwM8pMDKKQ7wu4PrG
 KNk/jJji0abGok1sb4a+NRbKEU5kAdafpZvvwboWWaLqF6xmLf34u9YmQeLIPYkquPPm
 N9VG00pM5/pHHah1EJqYRAn9fEr6eeY997he9mt1oHZJyTjHsn1M+XBq9c/ejrDdapEU
 33bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/jn32dDeM8C7WaNEnqpZJIQkb09OTkglE0Ep6+m7bAc=;
 b=DAwQUJXMRQ6C/W2b8a71A8+AEq8mNB1UC4b8DcT+UtgUcT/tQQBAC5vNX+JljfKPZ1
 G8duiDaMF2dYPDTEVXjhZZnf5LqCuCNfODvzR5OaOFbGdcHext2LxU0yAi8JGkJA4Wlq
 pKi6+6O8u+kHlxuoEBRLCKRHnuq+QEzbUxQFcpjAR1GJUEg7BhXX6VCK5o/MzGoWV+t/
 NyRMVLAqGpsMwborGgmjoJKjIPjPhPRLhygSAKubI0Q/2wFzGe3BebdHyIm3h/DwqWek
 Q3oz3WktwRE508py8h449V55ZG/9ulOPdTU+vhvgTOB+PWj9VcMdj3ZqkXkUVP0cncFV
 Nisg==
X-Gm-Message-State: AOAM533Vctjse+bI/XWSPA4N1eWLuq/kXsnBBcHZPp1RaIA9vsaSWrvJ
 hHGvDglThrj1c8MJHE8r0KxdzwP5USL7/dQpVzk=
X-Google-Smtp-Source: ABdhPJw1eCnBq8Jr1WV6StB/x5QbqkxAT7YXaOE6YHfaXlXzNgg4CXYsTfgxoHSSQA4qXHyekS7WtQ==
X-Received: by 2002:a17:90a:68ca:: with SMTP id
 q10mr16240062pjj.15.1610335168902; 
 Sun, 10 Jan 2021 19:19:28 -0800 (PST)
Received: from [10.68.201.25] (143.140.5.103.wi-fi.wi2.ne.jp. [103.5.140.143])
 by smtp.gmail.com with ESMTPSA id
 fs12sm12880081pjb.49.2021.01.10.19.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 19:19:28 -0800 (PST)
Subject: Re: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20210110041039.512225-1-wataash@wataash.com>
 <dab09234-8bff-f29f-ff16-402dc2a559c3@amsat.org>
From: Wataru Ashihara <wataash@wataash.com>
Message-ID: <b24c035a-7b0b-dcc3-1d6a-6c72d9b370ea@wataash.com>
Date: Mon, 11 Jan 2021 12:19:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dab09234-8bff-f29f-ff16-402dc2a559c3@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=wataash@wataash.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGhpbGlwcGUsIFJpY2hhcmQsIHRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nLg0KDQpPbiAyMDIx
LzAxLzExIDE6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBDYydpbmcg
U3RlZmFuLg0KPiANCj4gT24gMS8xMC8yMSA1OjEwIEFNLCBXYXRhcnUgQXNoaWhhcmEgd3Jv
dGU6DQo+PiBUaGlzIGZpeGVzIHRoZSBidWlsZCB3aXRoIC0tZW5hYmxlLXRjZy1pbnRlcnBy
ZXRlcjoNCj4+DQo+PiAgIGNsYW5nIC1JbGlicWVtdS1hcm0tc29mdG1tdS5mYS5wIC1JLiAt
SS4uIC1JdGFyZ2V0L2FybSAtSS4uL3RhcmdldC9hcm0gLUkuLi9kdGMvbGliZmR0IC1JLi4v
Y2Fwc3RvbmUvaW5jbHVkZS9jYXBzdG9uZSAtSXFhcGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hh
ZGVyIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1J
L3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9nbGliLTIuMC9pbmNsdWRlIC1YY2xhbmcgLWZj
b2xvci1kaWFnbm9zdGljcyAtcGlwZSAtV2FsbCAtV2ludmFsaWQtcGNoIC1XZXJyb3IgLXN0
ZD1nbnU5OSAtZyAtbTY0IC1tY3gxNiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJ
VFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5k
YW50LWRlY2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVz
IC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUt
ZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXky
ayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0
ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1Xbm8t
aW5pdGlhbGl6ZXItb3ZlcnJpZGVzIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVduby1z
aGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLXN0cmluZy1wbHVzLWludCAtV25vLXR5cGVkZWYt
cmVkZWZpbml0aW9uIC1Xbm8tdGF1dG9sb2dpY2FsLXR5cGUtbGltaXQtY29tcGFyZSAtZnN0
YWNrLXByb3RlY3Rvci1zdHJvbmcgLWlzeXN0ZW0gL2hvbWUvd3NoL3FjL3FlbXUvbGludXgt
aGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUgL2hvbWUvd3NoL3FjL3Fl
bXUvdGNnL3RjaSAtaXF1b3RlIC4gLWlxdW90ZSAvaG9tZS93c2gvcWMvcWVtdSAtaXF1b3Rl
IC9ob21lL3dzaC9xYy9xZW11L2FjY2VsL3RjZyAtaXF1b3RlIC9ob21lL3dzaC9xYy9xZW11
L2luY2x1ZGUgLWlxdW90ZSAvaG9tZS93c2gvcWMvcWVtdS9kaXNhcy9saWJ2aXhsIC1wdGhy
ZWFkIC1mUElDIC1pc3lzdGVtLi4vbGludXgtaGVhZGVycyAtaXN5c3RlbWxpbnV4LWhlYWRl
cnMgLURORUVEX0NQVV9IICctRENPTkZJR19UQVJHRVQ9ImFybS1zb2Z0bW11LWNvbmZpZy10
YXJnZXQuaCInICctRENPTkZJR19ERVZJQ0VTPSJhcm0tc29mdG1tdS1jb25maWctZGV2aWNl
cy5oIicgLU1EIC1NUSBsaWJxZW11LWFybS1zb2Z0bW11LmZhLnAvdGNnX3RjZy5jLm8gLU1G
IGxpYnFlbXUtYXJtLXNvZnRtbXUuZmEucC90Y2dfdGNnLmMuby5kIC1vIGxpYnFlbXUtYXJt
LXNvZnRtbXUuZmEucC90Y2dfdGNnLmMubyAtYyAuLi90Y2cvdGNnLmMNCj4+ICAgLi4vdGNn
L3RjZy5jOjEzNjoyMDogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAndGNnX291dF9kdXBpX3Zl
YycgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
V2F0YXJ1IEFzaGloYXJhIDx3YXRhYXNoQHdhdGFhc2guY29tPg0KPj4gLS0tDQo+PiAgdGNn
L3RjZy5jIHwgNyAtLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3RjZy90Y2cuYyBiL3RjZy90Y2cuYw0KPj4gaW5kZXgg
NDcyYmYxNzU1Yi4uMzJkZjE0OWIxMiAxMDA2NDQNCj4+IC0tLSBhL3RjZy90Y2cuYw0KPj4g
KysrIGIvdGNnL3RjZy5jDQo+PiBAQCAtMTE3LDggKzExNyw2IEBAIHN0YXRpYyBib29sIHRj
Z19vdXRfZHVwX3ZlYyhUQ0dDb250ZXh0ICpzLCBUQ0dUeXBlIHR5cGUsIHVuc2lnbmVkIHZl
Y2UsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR1JlZyBkc3QsIFRDR1Jl
ZyBzcmMpOw0KPj4gIHN0YXRpYyBib29sIHRjZ19vdXRfZHVwbV92ZWMoVENHQ29udGV4dCAq
cywgVENHVHlwZSB0eXBlLCB1bnNpZ25lZCB2ZWNlLA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVENHUmVnIGRzdCwgVENHUmVnIGJhc2UsIGludHB0cl90IG9mZnNldCk7
DQo+PiAtc3RhdGljIHZvaWQgdGNnX291dF9kdXBpX3ZlYyhUQ0dDb250ZXh0ICpzLCBUQ0dU
eXBlIHR5cGUsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0dSZWcgZHN0
LCB0Y2dfdGFyZ2V0X2xvbmcgYXJnKTsNCj4+ICBzdGF0aWMgdm9pZCB0Y2dfb3V0X3ZlY19v
cChUQ0dDb250ZXh0ICpzLCBUQ0dPcGNvZGUgb3BjLCB1bnNpZ25lZCB2ZWNsLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIHZlY2UsIGNvbnN0IFRDR0FyZyAq
YXJncywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBpbnQgKmNvbnN0
X2FyZ3MpOw0KPj4gQEAgLTEzMywxMSArMTMxLDYgQEAgc3RhdGljIGlubGluZSBib29sIHRj
Z19vdXRfZHVwbV92ZWMoVENHQ29udGV4dCAqcywgVENHVHlwZSB0eXBlLCB1bnNpZ25lZCB2
ZWNlLA0KPj4gIHsNCj4+ICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsNCj4+ICB9DQo+
PiAtc3RhdGljIGlubGluZSB2b2lkIHRjZ19vdXRfZHVwaV92ZWMoVENHQ29udGV4dCAqcywg
VENHVHlwZSB0eXBlLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFRDR1JlZyBkc3QsIHRjZ190YXJnZXRfbG9uZyBhcmcpDQo+PiAtew0KPj4gLSAgICBnX2Fz
c2VydF9ub3RfcmVhY2hlZCgpOw0KPj4gLX0NCj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgdGNn
X291dF92ZWNfb3AoVENHQ29udGV4dCAqcywgVENHT3Bjb2RlIG9wYywgdW5zaWduZWQgdmVj
bCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgdmVj
ZSwgY29uc3QgVENHQXJnICphcmdzLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBpbnQgKmNvbnN0X2FyZ3MpDQo+IA0KPiBBRkFJSyBUQ0kgZG9lcyBu
b3Qgc3VwcG9ydCB2ZWN0b3JzLCB1c2luZyB0aGVtIHdvdWxkIHRyaWdnZXINCj4gdGNnX2Rl
YnVnX2Fzc2VydCh0eXBlID09IFRDR19UWVBFX0k2NCkgaW4gdGNnX291dF9tb3ZpKCkuDQo+
IA0KPiBBcyB5b3VyIGFwcHJvYWNoIG1pZ2h0IGJyZWFrIG90aGVyIGJhY2tlbmRzLCBJJ20g
Z29pbmcgdG8NCj4gc2VuZCBhbiBhbHRlcm5hdGUgcGF0Y2ggdXNpbmcgX19hdHRyaWJ1dGVf
XygodW51c2VkKSkuDQoNCkN1cnJlbnRseSBpdCBkb2Vzbid0LiBVbmxpa2UgYWxsIHRoZSBv
dGhlciB0Y2dfb3V0XyooKSwNCnRjZ19vdXRfZHVwaV92ZWMoKSBpcyBub3QgdXNlZCBpbiB0
Y2cuYyBhcyBkaXNjdXNzZWQgaW4gWzFdLg0KDQo+IA0KPiBUaGFua3MgZm9yIHJlcG9ydGlu
ZyB0aGlzLA0KPiANCj4gUGhpbC4NCj4gDQoNCkkgZGlzY2FyZCB0aGlzIHBhdGNoIGluIGZh
dm9yIG9mIHRoZSB1bmNvbmRpdGlvbmFsbHktdXNpbmcgd2F5IG1lbnRpb25lZA0KaW4gWzFd
Lg0KDQpUaGFua3MuDQoNClsxXTogaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUv
aHRtbC9xZW11LWRldmVsLzIwMjEtMDEvbXNnMDE2NDcuaHRtbA0K

