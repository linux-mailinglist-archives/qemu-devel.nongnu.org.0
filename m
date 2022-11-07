Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593961F0F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzbt-0002Xz-Po; Mon, 07 Nov 2022 05:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1orzbr-0002Xb-SM
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:44:07 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1orzbi-0001BQ-0w
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:44:07 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id e123so8791279ybh.11
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gdvAakyIsF3dvAby5xgUeq6y7DC3UILcSB9PUXWFpY=;
 b=D96zWkHplHyQ0SuWR+LSHxHhTy9LDL/3u8hJY+UrqSl+YyXJZPHCBQuZUe/ft46AR9
 e/8NsSexMnSB6lcgUktoD1KOk0+yYY573UquK1Vpd5fimO+dOG3g5b2EskG3e8nlq9wc
 MOTZvBFpcyWwXgJhwk80quZPIqKezEr73nLqp2q/lyNcMMPJOzNT6abf/DYCcVWj1e6N
 TY68ZeK73LfjoYQ2HkSC7SGdTSGwGJRO9OvbsNWwh9UzFLJcT61gSvvlYTk8qQNQZpz0
 pNl9/duT1yLfhxdE3tQ6K1bqEmY1FrEcSWZgUY3emkKKuU5SmyBodjZxNP+vBVgVGTX9
 DUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gdvAakyIsF3dvAby5xgUeq6y7DC3UILcSB9PUXWFpY=;
 b=YZjTzgMBQdH2lIuZen7kMdGcam56kSWF8sI/DHRdAp1sV5CGacfm5ab3vb/Cco6Dd/
 WMDk/AolxLkXU0IJa8MuBvFsjIgtceZDboKDXd5qmEzX3OzksEEACzWBPowYwWwzw541
 BQzV79AqjdObiXNNRMRcQCCV9l0tQNczZcmyKktCSHkgzmS6Tyj13yVQDjQlximFO/ad
 626scqLNqKxkFchWDVwFnm9wB+oVDLBUg7H9X2u4sqCEhy629IEAFBtpkqpg24JR/5es
 0kIvbstkTck5qiGKM30Xw/b9WKDk7VpeZJycjGZFHMNupiddHUcLlA3hToqCRFv5Qfz0
 rW+A==
X-Gm-Message-State: ACrzQf3q10ml1owLQRWeT/oSVqw1m7/FbUVB07mHY51R+AG7NIfoGaMa
 XC5aEu6ISpKzima+qTp3zj9vkQpLCdPxlSLMAWc=
X-Google-Smtp-Source: AMsMyM6dhqPjjxBaNuNTKKtnuWhpTP19ZZ16BNfeaoQ/yoK0uzikrqV4u7HYfouWAI9wPnqaQvFvcm3aqquMQ5RhTIs=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr48871009ybe.642.1667817836247; Mon, 07
 Nov 2022 02:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 7 Nov 2022 05:43:44 -0500
Message-ID: <CAJSP0QW8cYteo8aeDkg0ZZs=6oebdtfGGVnN74pW+gaK10=HSQ@mail.gmail.com>
Subject: Re: [PULL v3 00/81] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgTWljaGFlbCBhbmQgSWdvciwNCkxvb2tzIGxpa2UgdGhlIEFDUEkgY29tbWl0cyBicm9rZW4g
dGhlIHZpcnRpby12Z2EgbW9kdWxlOg0KDQo+Pj4gUVRFU1RfUUVNVV9JTUc9Li9xZW11LWltZyBN
QUxMT0NfUEVSVFVSQl89NjAgR19URVNUX0RCVVNfREFFTU9OPS9idWlsZHMvcWVtdS1wcm9qZWN0
L3FlbXUvdGVzdHMvZGJ1cy12bXN0YXRlLWRhZW1vbi5zaCBRVEVTVF9RRU1VX0JJTkFSWT0uL3Fl
bXUtc3lzdGVtLW9yMWsgUVRFU1RfUUVNVV9TVE9SQUdFX0RBRU1PTl9CSU5BUlk9Li9zdG9yYWdl
LWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uIC9idWlsZHMvcWVtdS1wcm9qZWN0L3FlbXUvYnVp
bGQvdGVzdHMvcXRlc3QvZGV2aWNlLWludHJvc3BlY3QtdGVzdCAtLXRhcCAtaw0K4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVIOKcgCDigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCnN0ZGVycjoN
CmZhaWxlZCB0byBvcGVuIG1vZHVsZToNCi9idWlsZHMvcWVtdS1wcm9qZWN0L3FlbXUvYnVpbGQv
cWVtdS1idW5kbGUvdXNyL2xvY2FsL2xpYjY0L3FlbXUvaHctZGlzcGxheS12aXJ0aW8tdmdhLnNv
Og0KdW5kZWZpbmVkIHN5bWJvbDogYW1sX3JldHVybg0KcWVtdS1zeXN0ZW0tb3IxazogLi4vdXRp
bC9lcnJvci5jOjU5OiBlcnJvcl9zZXR2OiBBc3NlcnRpb24gYCplcnJwID09DQpOVUxMJyBmYWls
ZWQuDQpCcm9rZW4gcGlwZQ0KLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzoxODg6IGtpbGxfcWVt
dSgpIGRldGVjdGVkIFFFTVUgZGVhdGggZnJvbQ0Kc2lnbmFsIDYgKEFib3J0ZWQpIChjb3JlIGR1
bXBlZCkNClRBUCBwYXJzaW5nIGVycm9yOiBUb28gZmV3IHRlc3RzIHJ1biAoZXhwZWN0ZWQgNiwg
Z290IDApDQoodGVzdCBwcm9ncmFtIGV4aXRlZCB3aXRoIHN0YXR1cyBjb2RlIC02KQ0K4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
DQoxNTQvMjc0IHFlbXU6cXRlc3QrcXRlc3Qtb3IxayAvIHF0ZXN0LW9yMWsvbWFjaGluZS1ub25l
LXRlc3QgT0sgMC4wNXMNCjEgc3VidGVzdHMgcGFzc2VkDQoxNTUvMjc0IHFlbXU6cXRlc3QrcXRl
c3Qtb3IxayAvIHF0ZXN0LW9yMWsvcW1wLXRlc3QgT0sgMC4xOXMgNCBzdWJ0ZXN0cyBwYXNzZWQN
CjE1Ni8yNzQgcWVtdTpxdGVzdCtxdGVzdC1vcjFrIC8gcXRlc3Qtb3Ixay9xbXAtY21kLXRlc3Qg
RVJST1IgMS43MnMNCmtpbGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+Pj4gUVRFU1RfUUVNVV9J
TUc9Li9xZW11LWltZyBHX1RFU1RfREJVU19EQUVNT049L2J1aWxkcy9xZW11LXByb2plY3QvcWVt
dS90ZXN0cy9kYnVzLXZtc3RhdGUtZGFlbW9uLnNoIFFURVNUX1FFTVVfQklOQVJZPS4vcWVtdS1z
eXN0ZW0tb3IxayBRVEVTVF9RRU1VX1NUT1JBR0VfREFFTU9OX0JJTkFSWT0uL3N0b3JhZ2UtZGFl
bW9uL3FlbXUtc3RvcmFnZS1kYWVtb24gTUFMTE9DX1BFUlRVUkJfPTUzIC9idWlsZHMvcWVtdS1w
cm9qZWN0L3FlbXUvYnVpbGQvdGVzdHMvcXRlc3QvcW1wLWNtZC10ZXN0IC0tdGFwIC1rDQrigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUg4pyAIOKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0Kc3Rk
ZXJyOg0KZmFpbGVkIHRvIG9wZW4gbW9kdWxlOg0KL2J1aWxkcy9xZW11LXByb2plY3QvcWVtdS9i
dWlsZC9xZW11LWJ1bmRsZS91c3IvbG9jYWwvbGliNjQvcWVtdS9ody1kaXNwbGF5LXZpcnRpby12
Z2Euc286DQp1bmRlZmluZWQgc3ltYm9sOiBhbWxfcmV0dXJuDQpxZW11LXN5c3RlbS1vcjFrOiAu
Li91dGlsL2Vycm9yLmM6NTk6IGVycm9yX3NldHY6IEFzc2VydGlvbiBgKmVycnAgPT0NCk5VTEwn
IGZhaWxlZC4NCkJyb2tlbiBwaXBlDQouLi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOjE4ODoga2ls
bF9xZW11KCkgZGV0ZWN0ZWQgUUVNVSBkZWF0aCBmcm9tDQpzaWduYWwgNiAoQWJvcnRlZCkgKGNv
cmUgZHVtcGVkKQ0KVEFQIHBhcnNpbmcgZXJyb3I6IFRvbyBmZXcgdGVzdHMgcnVuIChleHBlY3Rl
ZCA2MiwgZ290IDMxKQ0KKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikN
CuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAlQ0KDQpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzMy
ODE0MjU0NTcNCg0KU3RlZmFuDQo=

