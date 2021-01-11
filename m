Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B096F2F0B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:23:07 +0100 (CET)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kynnO-0003Th-Oi
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kynlP-0002dZ-HI
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:21:03 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1kynlN-0008P1-R6
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:21:03 -0500
Received: by mail-pg1-x531.google.com with SMTP id 30so11707086pgr.6
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wataash-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Kvc+yYd47yv3slsQymIOV05Cm6e1glgWupBoAuc8/WQ=;
 b=yox5AtIdbcNXQY52/8UyMdsthgkrY9bU+Nsg6mrSYJLg//UnzBMgoaU95l0+823LDH
 v9jF9ir9OjdGbrRO9+93KbCtSwfShZMN6K7BVeZbBX7seEaG0RAt8c903sSxZ3e8vLfz
 Bvp53leig1gEuAaKzneJPuDJ+OsQ2/3Uk3C+OkQjUqyDBCd1fSSgwWr9qK32fDtvhNaf
 H4nxcQZ98DhgJJm4QfGbmmD85PmrtvTlZQ3TVGZWfJ0o2G3mehMpYqw1byEakTqcQowg
 W1v4Xxsyh5Z6uzE47nprhyq26qKqQy/gjCcgmjKi1+7lvCYSUl3aBcnMs8xyt9XACjro
 anJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kvc+yYd47yv3slsQymIOV05Cm6e1glgWupBoAuc8/WQ=;
 b=r9sz2xxlDvVunsnmtsj6v9rNflGIEKBDClfiTmqfy/oulmboP3Ab6oAkNf5Y4jkz64
 J/dpWJtI04Ip3PtpZCMPdvBMFwY/7nSgZ25sCS4bdBiMOh0w8pw+YPhRiA/ah7o5EkQ/
 D3EmZubBjTf66MXm0Pfn9Gmf+s8sjT5Nvo8gKoNFB+SjZwTq9r4SKovj0yxZ8Zbc9J7f
 nor5Vrrl1suPTSxqRydxPyXMDI1RlAXvRczyRL3rdv1eYmhoUra0r6sTNFP2AyrPcrrL
 0xnFRTXXHdsTX5R7CE49pldYOfTkloK/HEh+eBjJ2k+4FQ4J60zLGaYKpoElddbVdXFu
 pDYQ==
X-Gm-Message-State: AOAM53377o3TWrQ4du+aMG/mKkhQC3lNzHi22J8qml6h52IShJ4qhIPj
 8n5dXlsr6Tit25JjqyF/oUbKmQq7t3e9h+vL
X-Google-Smtp-Source: ABdhPJzvuzFXyKHah0zYMOT/tjb4HMep+8ThU6djoe9+0SXbk97pd01ClFrKKj2gSFjcbk3AbUu49g==
X-Received: by 2002:aa7:8423:0:b029:1a8:2c01:88f with SMTP id
 q3-20020aa784230000b02901a82c01088fmr17877756pfn.74.1610335259950; 
 Sun, 10 Jan 2021 19:20:59 -0800 (PST)
Received: from [10.68.201.25] (143.140.5.103.wi-fi.wi2.ne.jp. [103.5.140.143])
 by smtp.gmail.com with ESMTPSA id
 a26sm18723041pgd.64.2021.01.10.19.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 19:20:59 -0800 (PST)
Subject: Re: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210110041039.512225-1-wataash@wataash.com>
 <7ee330fa-62e7-353d-333f-cd4ed7a065a5@linaro.org>
 <b35a3b47-e9d1-3d0a-9142-2f1703c0e115@amsat.org>
From: Wataru Ashihara <wataash@wataash.com>
Message-ID: <cdd27331-167c-458a-878e-9cb6468350a9@wataash.com>
Date: Mon, 11 Jan 2021 12:20:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b35a3b47-e9d1-3d0a-9142-2f1703c0e115@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=wataash@wataash.com; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjAyMS8wMS8xMSA2OjMyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4g
T24gMS8xMC8yMSA3OjIzIFBNLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+IE9uIDEv
OS8yMSA2OjEwIFBNLCBXYXRhcnUgQXNoaWhhcmEgd3JvdGU6DQo+Pj4gVGhpcyBmaXhlcyB0
aGUgYnVpbGQgd2l0aCAtLWVuYWJsZS10Y2ctaW50ZXJwcmV0ZXI6DQo+Pj4NCj4+PiAgIGNs
YW5nIC1JbGlicWVtdS1hcm0tc29mdG1tdS5mYS5wIC1JLiAtSS4uIC1JdGFyZ2V0L2FybSAt
SS4uL3RhcmdldC9hcm0gLUkuLi9kdGMvbGliZmR0IC1JLi4vY2Fwc3RvbmUvaW5jbHVkZS9j
YXBzdG9uZSAtSXFhcGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRl
L3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWIveDg2XzY0LWxp
bnV4LWdudS9nbGliLTIuMC9pbmNsdWRlIC1YY2xhbmcgLWZjb2xvci1kaWFnbm9zdGljcyAt
cGlwZSAtV2FsbCAtV2ludmFsaWQtcGNoIC1XZXJyb3IgLXN0ZD1nbnU5OSAtZyAtbTY0IC1t
Y3gxNiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxF
X1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYg
LVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFz
aW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUt
bGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2ln
bm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlm
LWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1Xbm8taW5pdGlhbGl6ZXItb3ZlcnJp
ZGVzIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1
ZSAtV25vLXN0cmluZy1wbHVzLWludCAtV25vLXR5cGVkZWYtcmVkZWZpbml0aW9uIC1Xbm8t
dGF1dG9sb2dpY2FsLXR5cGUtbGltaXQtY29tcGFyZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJv
bmcgLWlzeXN0ZW0gL2hvbWUvd3NoL3FjL3FlbXUvbGludXgtaGVhZGVycyAtaXN5c3RlbSBs
aW51eC1oZWFkZXJzIC1pcXVvdGUgL2hvbWUvd3NoL3FjL3FlbXUvdGNnL3RjaSAtaXF1b3Rl
IC4gLWlxdW90ZSAvaG9tZS93c2gvcWMvcWVtdSAtaXF1b3RlIC9ob21lL3dzaC9xYy9xZW11
L2FjY2VsL3RjZyAtaXF1b3RlIC9ob21lL3dzaC9xYy9xZW11L2luY2x1ZGUgLWlxdW90ZSAv
aG9tZS93c2gvcWMvcWVtdS9kaXNhcy9saWJ2aXhsIC1wdGhyZWFkIC1mUElDIC1pc3lzdGVt
Li4vbGludXgtaGVhZGVycyAtaXN5c3RlbWxpbnV4LWhlYWRlcnMgLURORUVEX0NQVV9IICct
RENPTkZJR19UQVJHRVQ9ImFybS1zb2Z0bW11LWNvbmZpZy10YXJnZXQuaCInICctRENPTkZJ
R19ERVZJQ0VTPSJhcm0tc29mdG1tdS1jb25maWctZGV2aWNlcy5oIicgLU1EIC1NUSBsaWJx
ZW11LWFybS1zb2Z0bW11LmZhLnAvdGNnX3RjZy5jLm8gLU1GIGxpYnFlbXUtYXJtLXNvZnRt
bXUuZmEucC90Y2dfdGNnLmMuby5kIC1vIGxpYnFlbXUtYXJtLXNvZnRtbXUuZmEucC90Y2df
dGNnLmMubyAtYyAuLi90Y2cvdGNnLmMNCj4+PiAgIC4uL3RjZy90Y2cuYzoxMzY6MjA6IGVy
cm9yOiB1bnVzZWQgZnVuY3Rpb24gJ3RjZ19vdXRfZHVwaV92ZWMnIFstV2Vycm9yLC1XdW51
c2VkLWZ1bmN0aW9uXQ0KPj4NCj4+DQo+PiBXaGF0IHZlcnNpb24gb2YgY2xhbmc/DQo+PiBX
aXRoIGNsYW5nIDEwLCBJIGNhbid0IGV2ZW4gcnVuIGNvbmZpZ3VyZSB3aXRob3V0IC0tZGlz
YWJsZS13ZXJyb3IuDQo+IA0KPiBjbGFuZyB2ZXJzaW9uIDEwLjAuMSAoRmVkb3JhIDEwLjAu
MS0zLmZjMzIpDQo+IA0KPiBJIHRlc3RlZCB1c2luZzoNCj4gDQo+IC4uL2NvbmZpZ3VyZSAn
LS1jYz1jbGFuZycgJy0tY3h4PWNsYW5nKysnIFwNCj4gICctLWV4dHJhLWNmbGFncz0tV3Vu
dXNlZC1mdW5jdGlvbicgJy0tZW5hYmxlLXRjZy1pbnRlcnByZXRlcicgXA0KPiAgJy0tZGlz
YWJsZS10b29scycgJy0tdGFyZ2V0LWxpc3Q9YXJtLXNvZnRtbXUnDQo+IA0KDQogICQgY2xh
bmcgLS12ZXJzaW9uDQogIGNsYW5nIHZlcnNpb24gMTAuMC4wLTR1YnVudHUxDQogIFRhcmdl
dDogeDg2XzY0LXBjLWxpbnV4LWdudQ0KICBUaHJlYWQgbW9kZWw6IHBvc2l4DQogIEluc3Rh
bGxlZERpcjogL3Vzci9iaW4NCg0KQW5kIEkgY29uZmlndXJlZCB3aXRoOg0KDQogIC4uL2Nv
bmZpZ3VyZSAtLXByZWZpeD0kSE9NRS9vcHQvcWVtdS10Y2kgLS1jYz1jbGFuZyAtLWhvc3Qt
Y2M9Y2xhbmcgLS1jeHg9Y2xhbmcrKyAtLWVuYWJsZS1kZWJ1ZyAtLWVuYWJsZS10Y2ctaW50
ZXJwcmV0ZXIgLS1lbmFibGUtZGVidWctdGNnIC0tZW5hYmxlLWRlYnVnLWluZm8gLS1lbmFi
bGUtZGVidWctbXV0ZXgNCg==

