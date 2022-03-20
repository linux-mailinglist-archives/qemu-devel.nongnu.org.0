Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200E4E1E1D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:09:19 +0100 (CET)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3jh-0000o7-Uh
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:09:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwestover.kw@gmail.com>)
 id 1nW3ey-0006Az-QM
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:04:24 -0400
Received: from [2607:f8b0:4864:20::d35] (port=44789
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kwestover.kw@gmail.com>)
 id 1nW3ew-0004aa-PP
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:04:24 -0400
Received: by mail-io1-xd35.google.com with SMTP id e22so14913288ioe.11
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject; bh=Tk4yoMUs8zVUbEK5kfMB/ijzwsBGCgAse0P9NdqBqag=;
 b=SGjSqu4yhJfsCBYGED8P+kE1wuGxWFRJXLtx6YLGmEgCCqR5pmtWxHF1W8+pTyJ0kw
 aMagoaD1hdRdHQ6TedaBwJvzxmLOGGy7hCqaAoqgZVJ0IMBNpwLjulSs4EoD9ImgjIRY
 fdvV573NpKES+eDmB7wQGK8ZsEs1u6KBw5iZwCPpUoW9NimIUg2ro1l1wGx0J9VD7Rzw
 f4I1CTAEJm87o+a00fzTj7vWnwNzAvXEjp73/27bvyKHcMhzCJ9NL1EOyUXp3+468OKr
 wKUq1bFr72F/Lakjyzvp2GHnpFeK58Pu9uwtAMALBocUZDlLSosjyoZ7WHXzHlwqn6qD
 8Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject;
 bh=Tk4yoMUs8zVUbEK5kfMB/ijzwsBGCgAse0P9NdqBqag=;
 b=afPnZsCaY6ymeafxa9vgicZ0a33YW7evrBMn8fOZZbc9rRpZ3W/N45Uf+jESCQB1/+
 XUXcJyzVEil0dejBHjJTTI1Drf/ShzumCs4anodwa0vV7J5Pewg515duzvAyGJMz2v9Q
 W/hmpemy2nr4mQApmMyLoic7uUDqmmfzpuJylTf36UupuS2ahUBHzhEVIa11+e5xnRqR
 mPaq2sHYNMl4cm8IXmNalMiHCCUkWMZiqTv6N7lbOZpFrvZ2CE+J6VcldBqeceEH1yEc
 Q7F2S1e4yyxoOfvs4HsTmyjoHxe4NpBkrQ49vy3d4Pn5BtI1xcGJuVKLcMpcGFQo0x7+
 Ht7g==
X-Gm-Message-State: AOAM533FxxccepHn2Dm/B4srRI4EvSz2ktNw74JWLNn8jVFDd95jeKlH
 z490uYnzZ46QqbhKPaUqk+30854Ja2IQlQ==
X-Google-Smtp-Source: ABdhPJyO/ba4C699abuVQpRzXLLkdz3/ghQHWyxBj/sGOcCLc5r0/v73p6Mvjk8SiNaidM3rqHvPDw==
X-Received: by 2002:a05:6602:341e:b0:648:a68e:e543 with SMTP id
 n30-20020a056602341e00b00648a68ee543mr8678206ioz.4.1647813860500; 
 Sun, 20 Mar 2022 15:04:20 -0700 (PDT)
Received: from [192.168.1.115] (cable-217-24.sssnet.com. [24.140.217.24])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a056602134300b0064620a85b6dsm7995855iov.12.2022.03.20.15.04.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 15:04:19 -0700 (PDT)
Message-ID: <cbb051b2-956d-9720-34cb-764034a0dd84@gmail.com>
Date: Sun, 20 Mar 2022 18:04:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Ben Westover <kwestover.kw@gmail.com>
Subject: Account creation on QEMU Wiki
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PDlYjk8B0dtfkxcjpQEqokgB"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=kwestover.kw@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 20 Mar 2022 18:08:04 -0400
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PDlYjk8B0dtfkxcjpQEqokgB
Content-Type: multipart/mixed; boundary="------------yvrF20AsQ2p0xNHpPW403K0z";
 protected-headers="v1"
From: Ben Westover <kwestover.kw@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <cbb051b2-956d-9720-34cb-764034a0dd84@gmail.com>
Subject: Account creation on QEMU Wiki

--------------yvrF20AsQ2p0xNHpPW403K0z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkknZCBsaWtlIHRvIGNyZWF0ZSBhbiBhY2NvdW50IG9uIHRoZSBRRU1VIFdp
a2ksIGJ1dCBhcyBpdCBzYXlzIG9uIHRoZSANCm1haW4gcGFnZSwgYWNjb3VudCBjcmVhdGlv
biBpcyBjdXJyZW50bHkgZGlzYWJsZWQgdG8gcmVkdWNlIHNwYW0uDQpJdCBzYXlzIHRvIGFz
ayBzb21lb25lIHdpdGggYW4gZXhpc3RpbmcgYWNjb3VudCB0byBjcmVhdGUgb25lIGZvciBt
ZSwgDQpidXQgSSBkb24ndCBrbm93IGFueW9uZSB3aG8gaGFzIG9uZSwgc28gSSdtIGFza2lu
ZyBoZXJlLg0KDQpUaGFua3MsDQotLQ0KQmVuIFdlc3RvdmVyDQo=

--------------yvrF20AsQ2p0xNHpPW403K0z--

--------------PDlYjk8B0dtfkxcjpQEqokgB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEOGnacqRhdU6eNmtFwxHF9U6JtpgFAmI3pOEFAwAAAAAACgkQwxHF9U6JtpgQ
PBAAqkD3ILKwrk06ef7vVPSrfeUICeZ846/zJgdGp/Gv+Oy+rXoLQcQoVFCLcGAcDm1c19opX+n0
f+Tr1WB0ovDX/rezcOrJtYAfWKIVSg1dbDeRlJBDbuxEPKpdHmpXRhZKNTqIWSSLTvNbb4XUwLro
DUUvB7YIvFixTNz3e6f7FEwAk3/mQT/UVxJr2QSzcUgbvwDOKECxJS4zVB8ZpFIhouivkUXtR8lP
RrOzSDyqdbIZ34DE17vx3Lb/kaNDqqjg+IGrK2L1pveZUotCtvMm4/ZCJsDBPDENlP7JoMgcxkwN
L1zU0YD4sjlkO32nGIIywlIuIWaMum9DrYRxAW7TCBhlZYCDORKmhMtavOTznBkl6dbsvic/6d1o
PZMRIIEadsSzgqHkarmHXPcQDYp60MWEyekWZAqTF6BkNo0Nec1OotA/q6PUYQA2J0kADdEaUAUE
Uuz1Lsiv7Z69qrkyjczlQcIa42tBYBtBSBNEYRxMJ4Ryttll/ZibOuBJWISchHYWoCNh572GBPSy
sHn61ol09hdlk5yP1jx6WKBYzXspQC00leEMjhEG9RBEYTfiWOGzdjpGD58G+sfpVosuQApxNTKf
1Y3bulwCJa7mLS4XXRmOp58R46m5cFACfBQo3DbIx0KDy++YMWG05ioR8I1M5iTk6ys+2SG4+xIc
8do=
=yu7p
-----END PGP SIGNATURE-----

--------------PDlYjk8B0dtfkxcjpQEqokgB--

