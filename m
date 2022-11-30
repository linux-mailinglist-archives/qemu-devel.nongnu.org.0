Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9163E3B7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VuP-0001He-MV; Wed, 30 Nov 2022 17:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1p0VuN-0001HW-UB
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:50:27 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1p0VuM-0004Fx-4L
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:50:27 -0500
Received: by mail-il1-x132.google.com with SMTP id h17so24972ila.6
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fbrlc1g78sfNVy4j5xkmzOi6RYnzjuM51oORpGujRvc=;
 b=PnLLp3KAnA7hH5rk/0uCBqZ3UjDN/nTKTGhWybwiLNWiLlmLqIQ+hbmzb4izK+OXIU
 jaiwIJS5C35PNnU/7jcF1yxiaBHhp6z+sdSWVD5NuNVg0g6BRFN/PXCYBjAs5PqUvj01
 TBMxyl6mtUgOSL3vFvrTcudMar7k0oXHGG1fJfSi4SBeYZLxmVzydr5mHE2KI1JQt3aj
 aXWiQRaDGW6kgvevURgStWYGciKl0z3UA0+fBrHk+RSx6WZY/fUtctVQYbfj69Q9lCYM
 1zUw0/0c1W4Vht/tV4Mv5feu1uL5tTyC6SFnzJS5aO1eEz5RWqFNSJkP0KvVeLypWk80
 vBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbrlc1g78sfNVy4j5xkmzOi6RYnzjuM51oORpGujRvc=;
 b=lSSaIGlosFAPmDSjSPjNzNUMoj533UUoRKy4doP7itT1tueEPXtgoZx9F2VGT04uFy
 jL0NL5u9PlmXxzDGh6tjzyQbTpQWUVZeV1UUMiKjbQsQ1JPjUOSFZIf3M5MU7hdXoQ8F
 wISE0uq64Nr5aZjPlkWTpZVe5chjHGLDUVDGfxlBRcGXo+mzTskBt9PEAQqcNLKyTeFb
 RWV54HP1J+0EoKuQP88TGe/tu7o6V92SgKSTfPuWnh4h75FhD6T0meAhYNEPXdbNgQ51
 u8X+4DW+ur3QfqXjDG7mFJk/Tb3jBHNlUdBCnXdtY8qZ3KkQ3hTHp1bSiVtFqxlPQPvm
 SwGA==
X-Gm-Message-State: ANoB5pl/l2ogbiFAICW4HmNrFGqvR45flZQHPcfUOeQ6e4PdBegtmicG
 YAVWV6Sh+mxQuGWgxlS6I02TUqDx3f8+e7KA/TScDovlrVIv4+FVla9MYbFzeCbNbHLu+iZUgl8
 1357xuf0Ti4Uw/R6hMMyxWpmABgFVK44MlWjKm/742cwFuzk7UkaWTW3hYUtOmd7Ucf7a
X-Google-Smtp-Source: AA0mqf6OZnR2QnL7KjeF4HGFKsnnCd4L4rDV0qllhuxfzalL2c8xndJNwOrUCTGmJhMfdmwvE+NVKA==
X-Received: by 2002:a92:c74a:0:b0:303:22f0:412a with SMTP id
 y10-20020a92c74a000000b0030322f0412amr4382741ilp.18.1669848617976; 
 Wed, 30 Nov 2022 14:50:17 -0800 (PST)
Received: from smtpclient.apple ([141.215.208.9])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a056638008c00b0036374fc6523sm1039914jao.24.2022.11.30.14.50.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:50:17 -0800 (PST)
From: Nada Lachtar <nlachtar@umich.edu>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_51080775-4EF5-4756-8666-99B71A0FD22F";
 protocol="application/pkcs7-signature"; micalg=sha-256
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Question about CPUTLBEntry
Message-Id: <73A7E42B-E0AD-4321-8D46-754B363178C7@umich.edu>
Date: Wed, 30 Nov 2022 17:50:06 -0500
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=nlachtar@umich.edu; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


--Apple-Mail=_51080775-4EF5-4756-8666-99B71A0FD22F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello,


I=E2=80=99m trying to understand the structure of TLB in QEMU/tcg, in =
order to extract the physical address from the CPUTLBEntry. Would this =
be possible without having the virtual address and use tlb_lookup? For =
example, I would like to read all the physical addresses that are =
recorded in the TLB table without the need for a virtual address to =
translate the entry.

I would appreciate your help in directing me to what =
functions/structures to use to achieve this.

Thank you,


Nada


--Apple-Mail=_51080775-4EF5-4756-8666-99B71A0FD22F
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCAzYw
ggMyMIICGqADAgECAgr4Fib7StCNw5mAMA0GCSqGSIb3DQEBCwUAMEcxFTATBgNVBAMTDE5hZGEg
TGFjaHRhcjEhMB8GCSqGSIb3DQEJARYSbmxhY2h0YXJAdW1pY2guZWR1MQswCQYDVQQGEwJVUzAe
Fw0yMjA1MDgxNDU3MDFaFw0yNzA1MDgxNDU3MDFaMEcxFTATBgNVBAMTDE5hZGEgTGFjaHRhcjEh
MB8GCSqGSIb3DQEJARYSbmxhY2h0YXJAdW1pY2guZWR1MQswCQYDVQQGEwJVUzCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAOAAW4/9skOX1gHcaAUVi8US7jOkQgbkO4Sl/AHyv9XLHWtH
FxbUWkxnyMMycfulabjr4k0qvEwKJwFGik2UIS8AZc3qNYd5fASzmir+RQ+pxPZdgM1ezlDQdIyu
bb/vlmEtedSefX5Cgddrv/h0j9NVWW0S8njcKsX5V9ph1o298+EKZy6EWIgaJJv8lTfb75JI64ik
VVjxnSRCNbxXBYNvhFmrkHUdTul5+k7Qp7JN5vM72BGDK2MZX3tUaajFndl88Tah9SbY3ktTsiSW
Ieo51rB21A0xH0Q7f8l5kpJIn6QkWAMtxC1gyI3vFMu7jVzT1TtlIivR+vaQBQVIOJcCAwEAAaMg
MB4wDwYJKoZIhvcvAQEKBAIFADALBgNVHQ8EBAMCB4AwDQYJKoZIhvcNAQELBQADggEBAA61IZGc
ivUG+h0HJuxWivLVEe/sV8bHqS/XjPb9YHEpPRS1giLj8uwdvu39EG6YpIgRfc4/K091z6Y58lBU
vVhmoZ4anqZIEy8NE/TqMZn6KlUBNcBcmicSpdGUqPqkRVwiyB+EtinlCWMHmYcq7KAxs8EKPbgU
0fQ9UuT+WhH95QknNCz1FofQCv6LnjNZMTjFiXy00Dv9Ygk2sW4DXzldzDGqB84C/eNP8AogWSwO
nj8duv1LUY0b36vADY0uFQqo/Qwf5Bf3AgpAGLNJZO21QV6b763KTZRwQbJ5p88/nKhJdNTJ8tYu
g7jzT2vKO61/DOvILmP1oRD88yAfbC4xggHrMIIB5wIBATBVMEcxFTATBgNVBAMTDE5hZGEgTGFj
aHRhcjEhMB8GCSqGSIb3DQEJARYSbmxhY2h0YXJAdW1pY2guZWR1MQswCQYDVQQGEwJVUwIK+BYm
+0rQjcOZgDANBglghkgBZQMEAgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTIyMTEzMDIyNTAwNlowLwYJKoZIhvcNAQkEMSIEIHHmpPMXywA0ZkSTYhbaYyNn
S6QgDXq58tvloXEzZciRMA0GCSqGSIb3DQEBCwUABIIBAMVVCWyTQ23gTlkdQu+fmi5p9fgKZ9Ki
+dYe9+RqoyScu538AB4naPt5cIATsyxB7a9Xcqz/XgQV5Bqtd/BOGrYi5xnVKJ8rFIHs+7O7goVH
L9Sjcstm4X/nAni51sKuZjPb/wro/GfY4fNzgB1dR7RSJrT4bYCsOPvq3X2gUXWKP5ulbjZY/IDr
cxgvkt8DPVmw1R8shCr9aigxyprh//kQ5mQZWflexFJs3KyhE120yDmzNO6pKfIKdGfzy2j4Dnv0
umd82Wn/cs5roNEglW7WVuXqL1N/5xHAZZIcVGOvGk8y52ML7Ac962W1/zrJorxfvIaU/L9K3DqD
ebIDVksAAAAAAAA=
--Apple-Mail=_51080775-4EF5-4756-8666-99B71A0FD22F--

