Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E572F0903
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 19:25:04 +0100 (CET)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyfOg-0003yU-Mk
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 13:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfNC-00035q-Pc
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:23:30 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfNA-0005IW-VK
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:23:30 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 4so8310317plk.5
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 10:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UBj76XjHaEqA65KPh/fOPUqyGfx/fS+V14AxjNOcYr8=;
 b=OjLK/ylb1nFGX2Ahg6fGosj7CazBBgTbeavl9z9V6JR69OWAJ/rEmJhCvpaW+n5Pot
 bD8fBmrnwAhJipChO/5/WBHx3iNWyPFkJ8xtR8I9dLal/PNjqV10kOzEZnb1OAboe90K
 TzadWFiJg8HwG1UdWWffwJoPdSN3a83v6rgaNJxax917AVp0Or1qjSHBNavVkgvyA6oZ
 YYAiD/ZYKnQUbJLIZQB0wnY3brgjCXnpw8/39Hrtkf4LmSUrUeRy4noKqgVfoc0SP/4C
 7uKaESG3lKFmzhoNxSyPdVoPf/vI3zpAoOu/vnwXcClz1H6Uk5evxY67rXZ632iK05rV
 atoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UBj76XjHaEqA65KPh/fOPUqyGfx/fS+V14AxjNOcYr8=;
 b=NrZI/oZ+wA9AtmSk8wXHTcGGQYLRc2QKk/TFHXb28gJdqsjC0iyqbqrfVlNHEEXlYX
 tdRtjDPHyNbzPPG5vz9slAmB0B0VHfbYcXFud4lMsdZGyl0frUi5Xo4EBf+FZD0J8P2u
 mpaXuifKvBWyqgxGEqz4orjsBQJuluaDKrHKLajmAIweheEnCzkjB1x8RrU3EFA+/TLT
 DE5LAqABK2mJiaxgpchObMfO1eTVR2btMmmfWLwUizQbxJcFvErWhjL9BU7Tub1Rgmd4
 FsVr9baGq/DA6DOa0gv9QzhL0Ax51xP/bC+5RyzlW4twxIZzbnfkmunbeOyzpQEMYJT3
 GEOg==
X-Gm-Message-State: AOAM533Nx/wkfVvzS22sswbV+mG7f0Avdl7w56bAwxIEq8X5umUzy3KE
 kETY7fXeCfU7FgOSjbpxkog9yAAKGHHAWg==
X-Google-Smtp-Source: ABdhPJzRLmkQtI21FDvD0O+XvYsp600RW6Ro0ftVo4HLgE5hNisRbr7umV0dMjw9po0/6ypE1yAGcA==
X-Received: by 2002:a17:90a:2b88:: with SMTP id
 u8mr14238209pjd.161.1610303006859; 
 Sun, 10 Jan 2021 10:23:26 -0800 (PST)
Received: from [10.25.18.117] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x18sm16472176pfr.158.2021.01.10.10.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 10:23:26 -0800 (PST)
Subject: Re: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
To: Wataru Ashihara <wataash@wataash.com>, qemu-devel@nongnu.org
References: <20210110041039.512225-1-wataash@wataash.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ee330fa-62e7-353d-333f-cd4ed7a065a5@linaro.org>
Date: Sun, 10 Jan 2021 08:23:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110041039.512225-1-wataash@wataash.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMS85LzIxIDY6MTAgUE0sIFdhdGFydSBBc2hpaGFyYSB3cm90ZToNCj4gVGhpcyBmaXhl
cyB0aGUgYnVpbGQgd2l0aCAtLWVuYWJsZS10Y2ctaW50ZXJwcmV0ZXI6DQo+IA0KPiAgIGNs
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
dGNnLmMubyAtYyAuLi90Y2cvdGNnLmMNCj4gICAuLi90Y2cvdGNnLmM6MTM2OjIwOiBlcnJv
cjogdW51c2VkIGZ1bmN0aW9uICd0Y2dfb3V0X2R1cGlfdmVjJyBbLVdlcnJvciwtV3VudXNl
ZC1mdW5jdGlvbl0NCg0KDQpXaGF0IHZlcnNpb24gb2YgY2xhbmc/DQpXaXRoIGNsYW5nIDEw
LCBJIGNhbid0IGV2ZW4gcnVuIGNvbmZpZ3VyZSB3aXRob3V0IC0tZGlzYWJsZS13ZXJyb3Iu
DQoNCg0KDQpyfg0K

