Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27BC65A364
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 10:40:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBYLS-0004p3-9g; Sat, 31 Dec 2022 04:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1pBYLP-0004ou-Ig
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:39:59 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1pBYLO-0004qD-1n
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:39:59 -0500
Received: by mail-io1-xd31.google.com with SMTP id r72so12213657iod.5
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GoPqelXMPcpy6BwP6flqjcif85HzZKndghysEYEKORo=;
 b=gjjH3pi/O/2Ommrk5SkNxoXoYitDcRGtoR5UqUWKeFU+vha6P2rS1VjQHZ+jSRDlxe
 c2S0vGFaU/5mw0lR7tg1XYb7kwCi/UM3HYYadwIuk8Y7laAgYqShGbM7liJIZsiPzlbt
 QdC4DwOOcIv9dZDLqRpwP4lvtmwH/n8A9doGMbfqNTxhS+WG0fbpoW+AIrotUps0pAET
 diM++u1R+ULD5iAiMgVann8l8DkSwe9DHWFwzZ+oxpyrGGGoGXcg1ALHl/Tsi12+ppQA
 AQYXlcjP2YqSSJS+dAGKI/cLTEt26DIEk/uVZ3nryQ5ZkDLw/aejkR7g9FpmwwbkzPSq
 J7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GoPqelXMPcpy6BwP6flqjcif85HzZKndghysEYEKORo=;
 b=lqI/WGiOCgKeVEwiLp3mnV8z5LSVVy53XRbDdqd5KEgMTHXqUTpiidOloIFrOdY36+
 VuTZfM+8HJL6XhBBKg1BwlD4UazoMQHaE+AYUEHKzVdk12BIbJsWmOIeJ0w/vGYjU+RF
 becd0sb4KvYxx7oDrhgiVce/WumhhMcrqGOEx5gYbLITLptF2z+alnw74PQryPHMGpFn
 NoMLWni4zDlmXJcht5kknGtcvdnhvOQthQAU+a1mhHwjsJyKxsThZ2IYvHkmcGRNAJgz
 6mPEq6s7reXWwrUyYXYqPkUN0WuOX6GlK5uoOEawcNtnYhhBAOk6lv7Rbjl6AY8MuN7p
 CtYA==
X-Gm-Message-State: AFqh2kp4Bea2z3dV9wJLuTN78cU63zFAeHSqgt8UxTjgBoeBIH4/MRzO
 +/GAi3cm27yU9xmaVMISVjYwft/IFH3PpLFlIJoyV6hMNKdShUOObPzIvKaApAt3kD+CgDKU4JJ
 ppGlYKc7TtYVtJfC6D/zljSw6W6xPweRxlZBLrluAbYbz4ee0tGQeaScO1oW98K3dM6h1b9k=
X-Google-Smtp-Source: AMrXdXtmL/lCDp04IWdTxJ5Tjk7MRGmHaADvLZJb3W+eM/G1X4f9w9/Ou8G29VkAfxkJgZG+nWOw9g==
X-Received: by 2002:a5e:950b:0:b0:6df:ed05:c6fd with SMTP id
 r11-20020a5e950b000000b006dfed05c6fdmr31530774ioj.10.1672479591282; 
 Sat, 31 Dec 2022 01:39:51 -0800 (PST)
Received: from smtpclient.apple ([2001:16a2:3815:4300:59c6:b67c:aca9:afc0])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a6be914000000b006dfa5af69f5sm8470674iof.0.2022.12.31.01.39.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Dec 2022 01:39:50 -0800 (PST)
From: Nada Lachtar <nlachtar@umich.edu>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_B689AAE0-461D-4BC7-9B43-ACB7B312EDCC";
 protocol="application/pkcs7-signature"; micalg=sha-256
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Question about TLBs
Message-Id: <C2E99F08-5683-4332-B4F6-E3BACFAB6423@umich.edu>
Date: Sat, 31 Dec 2022 12:39:37 +0300
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=nlachtar@umich.edu; helo=mail-io1-xd31.google.com
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


--Apple-Mail=_B689AAE0-461D-4BC7-9B43-ACB7B312EDCC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello,

Does Qemu maintain two TLB for the x86_64 system (i.e iTLB and dTLB)? If =
yes, can you please point me to how to access the dTLB and what data =
structure maintains this information!

I would appreciate any help,


Thanks,





--Apple-Mail=_B689AAE0-461D-4BC7-9B43-ACB7B312EDCC
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
hvcNAQkFMQ8XDTIyMTIzMTA5MzkzN1owLwYJKoZIhvcNAQkEMSIEIDrv/e/D6DIvbADSldSoxfCe
t0QBXYOAv78jyaWJ6GpVMA0GCSqGSIb3DQEBCwUABIIBALZVthm4uhDvTTStE570clktj7l4I+hn
xsKZeHE8qJT0SGMQpGROdY+i4hFSGHuPpA+/jtzOKt7Wjhg4X/wW7v+vvdqwhQmb8r9epL17mzte
ZEY0oXAehUD0gtbfrRCEnktesZH3ZDanNwhAT/T1F3NKWkgqeknrlGEHWvLY8n1fqkqJngEvXqYV
KBqXMoBNratcGA11KmFCq/motmr6uX7QGyaIsl8Ag7HL7xydLoylj+NK7T/mlohTkqe/45hb5Atn
lo9FPybOhuerurB323KEKgZLSPC6auPbtbxEUpkGr99mqw7XflDgwlJCUb/GWY05ocp7SZL/A/Om
mBERKysAAAAAAAA=
--Apple-Mail=_B689AAE0-461D-4BC7-9B43-ACB7B312EDCC--

