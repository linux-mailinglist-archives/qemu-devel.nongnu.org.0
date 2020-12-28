Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311C2E3D1F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 15:12:21 +0100 (CET)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kttFz-0006fd-VS
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 09:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <czh648639425@gmail.com>)
 id 1kts7w-0001Fx-JV
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:59:56 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <czh648639425@gmail.com>)
 id 1kts7v-0008CO-A8
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:59:56 -0500
Received: by mail-pj1-x1030.google.com with SMTP id lj6so5907043pjb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:subject:message-id:from:to:mime-version
 :content-transfer-encoding;
 bh=Xp0SmjlvPzEwqlBtdJAfosjtl3rkk+LHK+4649vmTyY=;
 b=RGyDYdAwAIVoqd6Yj6xkGOWFh5XtyZoE/Arf4v5uBsCDthoSHrFemVdGBmCw5ku1u4
 dztUQimaBQA5vjttuXY3aovrYrKtOeWrLRiou6AWmVI3+sQOXUTg6cdn0DnWUlspCmJm
 XH1E9LWBl0w0UZKSyeA9zNwVlyNIpQ0mi1VqgkjvLycV3EAOd6qgvMnUDMuBInJ/SnhL
 3vF9vXyMWmB9gM2JjC0Xufs3LO1iMWBlBXwV/xjtVC1X9ccsUsKNb2aLJEaCswAo/Yin
 mVMoSow4IDBocRE+potlP+CZVcXEdLv0Hk5NSfKwTxYzot8HRxaTTeofAeJFyfqqSDF2
 er2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:from:to:mime-version
 :content-transfer-encoding;
 bh=Xp0SmjlvPzEwqlBtdJAfosjtl3rkk+LHK+4649vmTyY=;
 b=W/lb2UtHyRBROtJoILn3XME+TdBUaR6z2HgnARnccYGLXBje/qwUEu6CF21zdTq2Tb
 6Rnngtwicy9WZ28sx6WsIBLDHpGnceGijDlawGzaFZHMq5R+juUV8VTWKoXnxeUFI9ZJ
 5rK/hTpDyhUgGO+JySygPcMGhT6wVzaeP9OZ64l20wCfO/WSm5Ifk2BGZwBFAVxFn4Wo
 J3zXUE9uyRT6ASUX6V08DzF+S5szos22U4bJaNJ+MLe6w9qrqeoR+x747nj6vggFdV56
 mM69ABDA9k6iuYbIu5JbFmczaEdUxat+H7ZCRGbh1S5Rc6K0+/dq5P+gqkbKoTqEOXr+
 FVjQ==
X-Gm-Message-State: AOAM532L5Sc5AldbPqus46k3oNPO4lGN9c2dEZtaY7iiRocAN2Phvbfl
 kWEoR/NE6yKIjQRxCtX8rPNHubWaQQ1vHg==
X-Google-Smtp-Source: ABdhPJw29b53MLKwAwMjcRs4fU4jrvjsqXKEOrW988pDnALlM9Msvm1hjmUsNmHuNQByzEPLEvdwFQ==
X-Received: by 2002:a17:90a:c20b:: with SMTP id
 e11mr20595483pjt.43.1609160393362; 
 Mon, 28 Dec 2020 04:59:53 -0800 (PST)
Received: from [172.31.255.253]
 (ec2-52-38-10-170.us-west-2.compute.amazonaws.com. [52.38.10.170])
 by smtp.gmail.com with ESMTPSA id b19sm35091049pfo.24.2020.12.28.04.59.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 04:59:52 -0800 (PST)
Date: Mon, 28 Dec 2020 20:59:39 +0800
Subject: [Question] VNC CA certificate update live
X-Priority: 3
Message-ID: <-9hr4cg-d4yk46-3dd17uwyp2nz-55r6nkouccbe-md34fa5rys74-ydxc1l9fwp3o-h74zi8-5f2vsfpu8ul36vw8shpq5qlmcu1zwg-ifrvh5nktjt6z00lli1hyz8oze8hzn-oteilg-yts4god4aig3.1609160379148@email.android.com>
From: zihao chang <czh648639425@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=czh648639425@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Dec 2020 09:11:04 -0500
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

PGRpdiBkaXI9ImF1dG8iPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWY7Zm9udC1z
aXplOjE2cHgiPjxkaXYgc3R5bGU9Im1hcmdpbjowcHg7d2lkdGg6Mzc4cHgiPjxkaXYgZGlyPSJh
dXRvIiBzdHlsZT0iZm9udC1zaXplOjExLjAwM3B0Ij5IaSBhbGw6PGRpdj48YnIgLz48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LXNpemU6MTEuMDAzcHQiPlRoZSBWTkMgb2YgUUVNVSBzdXBwb3RzIFRM
UyBlbmNyeXB0aW9uLiBUaGUgY2xpZW50ICZhbXA7IHNlcnZlciBjYW4gdXNlIGFyYml0cmFyeSBj
ZXJ0aWZpY2F0ZXMgZnJvbSBDQSBjZXJ0aWZpY2F0ZXMgdGhlIHJ1bm5pbmcgVk0gbG9hZGVkKHVz
ZXIgY2FuIHVzZSBuZXcgY2VydGlmaWNhdGVzIGltbWVkaWF0ZWx5KSwgYnV0IGlmIHRoZSBDQSBj
ZXJ0aWZpY2F0ZSBpcyBjaGFuZ2VkIHRvIGEgbmV3IG9uZSYjeGZmMGM7dGhlIHJ1bm5pbmcgVk0g
c3RpbGwgdXNlIHRoZSBvbGQgQ0EuwqA8L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTEuMDAz
cHQiPklzIGl0IHJlYXNvbmFibGUgdG8gcHJvdmlkZSBhbiBBUEkoZS5nLlFNUCkgdG8gcmVwbGFj
ZSB0aGUgQ0EgY2VydGlmaWNhdGUgZm9yIHJ1bm5pbmcgVk0gbGl2ZSYjeGZmMWY7QW55IHNlY3Vy
aXR5IHByb2JsZW0/PC9kaXY+PGRpdj48YnIgLz48L2Rpdj48ZGl2PjxiciAvPjwvZGl2PjxkaXYg
c3R5bGU9ImZvbnQtc2l6ZToxMS4wMDNwdCI+UmVnYXJkcyw8L2Rpdj48ZGl2IHN0eWxlPSJmb250
LXNpemU6MTEuMDAzcHQiPlppaGFvPC9kaXY+PGRpdj48YnIgLz48L2Rpdj48L2Rpdj48L2Rpdj48
ZGl2IHN0eWxlPSJoZWlnaHQ6MHB4Ij48L2Rpdj48L2Rpdj48L2Rpdj4=


