Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2087A613EB2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opb3C-0004oG-T7; Mon, 31 Oct 2022 16:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opb34-0004mF-Mh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:06:20 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opb32-0005fl-LU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:06:18 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3704852322fso47753827b3.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVAfhJKtfiebvCt8hTocHiIfzqQ9DQ43Eb41PoxMPK4=;
 b=IYnPuVE9hm7+yf880Vy32mksbNa2NnZkTatibo3IqKnYSyGldpXwG7yPxA6QCL6ZAj
 4qDI1oxlQmm3KdF/Ht8akHUetIAY8i3YS5pmNyH0zCthFejDwCweHcen1vUbzkPgqIj7
 scKwStffZXXMo7snwKtQIsItke/mlVWa5e4UtEWjxsc0LZ4UV5oEnOB8aJJ9aZnOaq1K
 YYP90uLXG9BuPpdYASmWTMyw9AQvkSl05L7umJkFRe5vcuC6ue607gxL6QxWz6fKjThS
 80FUItLUMRDbrTYLgefwsp1Ol00qUQll/NtlrAhkrShSzj0FtdPoWwORhB5324AeiZxC
 CnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVAfhJKtfiebvCt8hTocHiIfzqQ9DQ43Eb41PoxMPK4=;
 b=XJW5Xt/r3DrbthW+PiAPgNi5aPFsLWc29cnm2vEb5aLJh9NdO/9/w5vYjAosk/1HYw
 7II3sadRSn4MWeEF4e0eU5OR7N8XnbzBdH6P0NpAEyJllJTDyx5vYvJJGxkI4sokVL6H
 QNLV1/YbjxgtQaCgiDQ9Lt6UZhF+Ke+eUfDm439SyGY63tzUo0aa59UQt6EBakrvEzov
 nZ7VWn90jEXgcFDcCmTXQJws6ZI38hNKMDBbZ+i+aS6En14teIF9oXzVEFZLaalwcgrO
 HFKzf68zTrrdLPhBScP+HQpQ3CX1CzDbJjv7VO4aczMpE+vS43lVFVoG3BlDODBN4hD/
 jHJA==
X-Gm-Message-State: ACrzQf3lgbQn7OaTB9KYy6sQNXNte7jdYZbFOlhhvlFD/pEE4Me224R7
 IqumY/djprPY94uxOrKRWJVFEt9UOO2Ei07+Lug=
X-Google-Smtp-Source: AMsMyM63Z/1edAnsSmmVfe1z/oRK5Yh9VOUmLXtyBOyg+0HLuu4AwBC4D33QrSf+cPJ6hmq/QkiqgNOPnl+gjI+S+Lk=
X-Received: by 2002:a0d:f0c2:0:b0:370:10ff:17fa with SMTP id
 z185-20020a0df0c2000000b0037010ff17famr14421774ywe.239.1667246775548; Mon, 31
 Oct 2022 13:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 16:06:03 -0400
Message-ID: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

SGVyZSBpcyBhbm90aGVyIENJIGZhaWx1cmU6DQoNCnFlbXUtc3lzdGVtLWkzODY6IGN1cnJlbnQg
LXNtcCBjb25maWd1cmF0aW9uIHJlcXVpcmVzIGtlcm5lbCBpcnFjaGlwDQphbmQgWDJBUElDIEFQ
SSBzdXBwb3J0Lg0KQnJva2VuIHBpcGUNCi4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6MTc5OiBr
aWxsX3FlbXUoKSB0cmllZCB0byB0ZXJtaW5hdGUgUUVNVQ0KcHJvY2VzcyBidXQgZW5jb3VudGVy
ZWQgZXhpdCBzdGF0dXMgMSAoZXhwZWN0ZWQgMCkNClRBUCBwYXJzaW5nIGVycm9yOiBUb28gZmV3
IHRlc3RzIHJ1biAoZXhwZWN0ZWQgNDksIGdvdCAyMikNCih0ZXN0IHByb2dyYW0gZXhpdGVkIHdp
dGggc3RhdHVzIGNvZGUgLTYpDQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJUNCjYvMjAyIHFlbXU6cXRlc3QrcXRlc3QtaTM4NiAv
IHF0ZXN0LWkzODYvdGVzdC1obXAgT0sgNy40NnMgOSBzdWJ0ZXN0cyBwYXNzZWQNCuKWtiA3LzIw
MiBFUlJPUjouLi90ZXN0cy9xdGVzdC9iaW9zLXRhYmxlcy10ZXN0LmM6NTMzOnRlc3RfYWNwaV9h
c2w6DQphc3NlcnRpb24gZmFpbGVkOiAoYWxsX3RhYmxlc19tYXRjaCkgRVJST1INCjcvMjAyIHFl
bXU6cXRlc3QrcXRlc3QtYWFyY2g2NCAvIHF0ZXN0LWFhcmNoNjQvYmlvcy10YWJsZXMtdGVzdCBF
UlJPUg0KMTA4LjM0cyBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KPj4+IEdfVEVTVF9EQlVT
X0RBRU1PTj0vYnVpbGRzL3FlbXUtcHJvamVjdC9xZW11L3Rlc3RzL2RidXMtdm1zdGF0ZS1kYWVt
b24uc2ggUVRFU1RfUUVNVV9CSU5BUlk9Li9xZW11LXN5c3RlbS1hYXJjaDY0IE1BTExPQ19QRVJU
VVJCXz04OSAvYnVpbGRzL3FlbXUtcHJvamVjdC9xZW11L2J1aWxkL3Rlc3RzL3F0ZXN0L2Jpb3Mt
dGFibGVzLXRlc3QgLS10YXAgLWsNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAlSDinIAg4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQpzdGRlcnI6DQphY3BpLXRlc3Q6IFdhcm5pbmchIEFQSUMg
YmluYXJ5IGZpbGUgbWlzbWF0Y2guIEFjdHVhbA0KW2FtbDovdG1wL2FtbC1VS0I2VTFdLCBFeHBl
Y3RlZA0KW2FtbDp0ZXN0cy9kYXRhL2FjcGkvdmlydC9BUElDLmFjcGlobWF0dmlydF0uDQpTZWUg
c291cmNlIGZpbGUgdGVzdHMvcXRlc3QvYmlvcy10YWJsZXMtdGVzdC5jIGZvciBpbnN0cnVjdGlv
bnMgb24gaG93DQp0byB1cGRhdGUgZXhwZWN0ZWQgZmlsZXMuDQp0byBzZWUgQVNMIGRpZmYgYmV0
d2VlbiBtaXNtYXRjaGVkIGZpbGVzIGluc3RhbGwgSUFTTCwgcmVidWlsZCBRRU1VDQpmcm9tIHNj
cmF0Y2ggYW5kIHJlLXJ1biB0ZXN0cyB3aXRoIFY9MSBlbnZpcm9ubWVudCB2YXJpYWJsZSBzZXQq
Kg0KRVJST1I6Li4vdGVzdHMvcXRlc3QvYmlvcy10YWJsZXMtdGVzdC5jOjUzMzp0ZXN0X2FjcGlf
YXNsOiBhc3NlcnRpb24NCmZhaWxlZDogKGFsbF90YWJsZXNfbWF0Y2gpDQoodGVzdCBwcm9ncmFt
IGV4aXRlZCB3aXRoIHN0YXR1cyBjb2RlIC02KQ0KDQpodHRwczovL2dpdGxhYi5jb20vcWVtdS1w
cm9qZWN0L3FlbXUvLS9qb2JzLzMyNTM4MTc0NTMNCg==

