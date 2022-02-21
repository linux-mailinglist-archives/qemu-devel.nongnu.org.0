Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF444BDA03
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:45:11 +0100 (CET)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8zz-00023S-7u
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8lb-0006gq-0v
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:30:17 -0500
Received: from [2607:f8b0:4864:20::b29] (port=33514
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8lW-0007HQ-Rb
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:30:13 -0500
Received: by mail-yb1-xb29.google.com with SMTP id j2so34507323ybu.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hgqn6mCKOdT/OqeGo4s8oTyquQ4KzkIIcOiEzC3LNf8=;
 b=Yvbc3xnlaN5TX8zqAuTtc+S4Zsn3687eH8+0lsyNbBK1k/AadtsnUJd8XrOi+XJUWD
 DCWvEST0otfOX76n+yQRoTBDP1MxZo86EEvkZDOgAAqybDDaXzEG4kwHx0nACz+ey/mF
 lqgL+mWAmRycOJ6eXb8F3xsxYAQnG8E+6JKdYsxHU9I0CEXk3H3/8bkWFCEBeFajl1C9
 jrC28hSxnXkwXNvidOSlMEqrdLox8X0gVZiftgAAKZhmLj0T13DeCOlsNpiMUBG5dv/V
 8PhhIogFMkshCc57FFkhG6rI5u/BMZe0Z532zAOY42tF57disprjU0r+XpoM27K8zeli
 VxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hgqn6mCKOdT/OqeGo4s8oTyquQ4KzkIIcOiEzC3LNf8=;
 b=6TYLn7RvVrNlkargP2Gh8p0uAzBViwnQ72lmCIj4ZJ+9waJooZhcyAxPg6K4upodC6
 3aZKObWpVGgcDvdNCNMm2mR6JYkP3kPrFiqDox9xb35m3AMEK0qvgdNWffBJ75li5gyM
 2bGI0H72xqqsg9w3i4njQ/zsWU8yo62KBwDxbVeUKT2HxQaKhuDP13W+xFgVms0yKLb9
 tNfVjPBAxkvO1WgGnQ9QIcNRlvC1v35gPZ9TQI3loEeXeep3pJnutco8YSVqAdDkvbZY
 pJW0E5QrfNd7qgSm7cbz3bWfKBWkxFZayK1OVWvne4AUJRH6hqQQVbzdmFr9VfMmZWP1
 qPAA==
X-Gm-Message-State: AOAM531KSUyuTO+35OTf3Fg/ZV/FScsXttFerN0wK6bbggw6in0I5zfs
 WYC+seyHC4Nisr+ntZKOrfOA1iyV5I8NWHPuJZcFmg==
X-Google-Smtp-Source: ABdhPJycGyZNxByyjskKMdRjJtnyPoNrtg2t6625LbmiCiF/JCQ40xGnWSgPz6p2JXb8T2OsivyBfi1uV2gE29PvTQ4=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr15584447ybe.67.1645450209494; Mon, 21
 Feb 2022 05:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
 <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
In-Reply-To: <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 13:29:58 +0000
Message-ID: <CAFEAcA_zfd=5bSMKwVbSk0LStcWcYxFosazhiGz0nb2z=upSHQ@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkLCAxNiBGZWIgMjAyMiBhdCAxNzozMCwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCA4IEZlYiAyMDIyIGF0IDE4OjE4LCBQ
YXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9t
OiBTaGVuZ3RhbiBNYW8gPHN0bWFvQGdvb2dsZS5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTog
SGFvIFd1IDx3dWhhb3RzaEBnb29nbGUuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBDaHJpcyBSYXVl
ciA8Y3JhdWVyQGdvb2dsZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hlbmd0YW4gTWFvIDxz
dG1hb0Bnb29nbGUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgVmVudHVyZSA8dmVu
dHVyZUBnb29nbGUuY29tPg0KPiA+IC0tLQ0KPg0KPg0KPg0KPiBBcHBsaWVkIHRvIHRhcmdldC1h
cm0ubmV4dCwgdGhhbmtzLg0KDQpUaGlzIGhpdHMgYXNzZXJ0aW9ucyBpbiBzb21lIG9mIHRoZSBD
SSBqb2JzLCBlZzoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMv
MjExNjkzMjc2OQ0KDQoyNTgvNzE3IHFlbXU6cXRlc3QrcXRlc3QtYXJtIC8gcXRlc3QtYXJtL25w
Y203eHhfc2RoY2ktdGVzdCBJTlRFUlJVUFQNCjY0My4xNnMga2lsbGVkIGJ5IHNpZ25hbCA2IFNJ
R0FCUlQNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAlSDinIAg4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCVDQpzdGRlcnI6DQoqKiBNZXNzYWdlOiAwNjowNjo1MC4yMDU6IC90bXAvc2RoY2lfRjdF
VEgxDQoqKg0KRVJST1I6Li4vdGVzdHMvcXRlc3QvbnBjbTd4eF9zZGhjaS10ZXN0LmM6MTAxOnNk
d3JpdGVfcmVhZDogYXNzZXJ0aW9uDQpmYWlsZWQ6ICghc3RyY21wKHJtc2csIG1zZykpDQrigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJUNCi4uLnRlcm1pbmF0ZWQuDQoNCnNvIEkndmUgZHJvcHBlZCBpdCBhZ2Fpbi4NCg0KdGhhbmtz
DQotLSBQTU0NCg==

