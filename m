Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B333347EE4D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 11:39:10 +0100 (CET)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0hyf-0005gR-IK
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 05:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n0hxG-0004wX-3g
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:37:42 -0500
Received: from [2607:f8b0:4864:20::52e] (port=39665
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n0hxA-0000Zl-C5
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:37:40 -0500
Received: by mail-pg1-x52e.google.com with SMTP id r5so7324627pgi.6
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 02:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z69d3MUafooyxed5HzoTi7/hyaxjVMaauD3RaNhNryI=;
 b=qEhc8uMarJWXQs+VHQkHoCFudsxHt8tN8DO3gABeMfpuhN3OU863ja5unNKi9DSYLt
 fFUhcyh317r1BLEYaPbuJHr79tznmEqYIp5lsaE6iL0AJhBMkDOrxNnAncfALKpYrYIv
 B4MUCYmreq8tWTTHg5I+BJ6jSvqbd1PUeqzUZl7pV9EZCwGHbzKjsGzDvLPRV0N8bHeM
 UhkLMJuimxD5lKwpmipjirQMDAjP/58A9MtOCuO4lsRHPcXahpl+UEqit4EbaiK3J6HD
 pYjF44iyOR6IQH0o2kkXhPY/D7aWZJipAn+lAEkC3swv4YchN7LNlU+u67cTxGCSeLdM
 ZDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z69d3MUafooyxed5HzoTi7/hyaxjVMaauD3RaNhNryI=;
 b=8JNSkGdL57326pZwtt24E5nzoKMw7se9gGn260XxTbOQ2g4izs+6qtjrER9vJtiH8R
 LdPvsLvGQEfVbK3eTyE58mmon4583HUbqHgXGqj0NR+odRcmwN7TTKw3aeGS6cGVqqvd
 2toLHjVWZ9ZZSkE2Zj1rNODu6uvTAog1c/cpBPz/6sn019nqlrFN9fsWkHXWRZp5lsaH
 oYJazrlBDGRKWd8Z6LBQ7SrE23YUskRxTTjfvdPrQoLyupCpYb37RKxQY4e64Xk0A4jZ
 tkIdXaPqombQdvCGBxF6w+tH5zAMfOJ68vdb1/eT8H9K6pK3WJJJ5+0qWOlh0bnc0Uwq
 R18Q==
X-Gm-Message-State: AOAM533dl9JB35Zm2wAH+hSOAGf8VccWTe4XN1dSwthd8028AHRmiBko
 u+OSe4iyJGtoa14Pm23XuacMGU6jRnThGtMvcRuMUNX9u7D1og==
X-Google-Smtp-Source: ABdhPJxpsh5yIwnILiozYSO1wBaMSLT+/RSLJLKROZb9Pq4GUvaQaGoNzZBBEgMHWUh4dh6n2/pyaMMExlzQN0uWYto=
X-Received: by 2002:a63:d0:: with SMTP id 199mr5630334pga.14.1640342252997;
 Fri, 24 Dec 2021 02:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20211216104621.85108-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20211216104621.85108-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 24 Dec 2021 13:37:22 +0300
Message-ID: <CADO9X9QiaEaeXS4LDWxjhWhir8w_Lgo-fQ0Npr6EXTPayMX21g@mail.gmail.com>
Subject: Re: [PATCH v7] isa-applesmc: provide OSK forwarding on Apple hosts
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004cd17705d3e1f186"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004cd17705d3e1f186
Content-Type: text/plain; charset="UTF-8"

ping:
https://patchew.org/QEMU/20211216104621.85108-1-yaroshchuk2000@gmail.com/

--0000000000004cd17705d3e1f186
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">ping: <a href="https://patchew.org/QEMU/20211216104621.85108-1-yaroshchuk2000@gmail.com/">https://patchew.org/QEMU/20211216104621.85108-1-yaroshchuk2000@gmail.com/</a></div></div>

--0000000000004cd17705d3e1f186--

