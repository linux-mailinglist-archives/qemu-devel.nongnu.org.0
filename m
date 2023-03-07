Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74666AF616
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 20:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdFZ-0001Oz-7K; Tue, 07 Mar 2023 14:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oluwafunhmi@gmail.com>)
 id 1pZdFS-0001JT-65
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:45:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oluwafunhmi@gmail.com>)
 id 1pZdFQ-0002mG-LM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 14:45:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so11176238wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 11:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678218318;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i8t3iNct7jyt+9VzSMPLJXt2c+9gHsFPKshnCiRgzoY=;
 b=EuTtkjMy5kLYoSeX88Zq9a/W1c2xjOQup3OGR0pbBqSw+/ND0gPJjYEedt+KUXeQhg
 OWi2WTPx6jHfgt9sfWKhWLtoFo5KizOv4JuNtP4niwF0Oqo7fZPOLsVmhDtyZ7lxO89n
 v2c+pOY1ZmbElBu/DSx1UbI9tgxia6eccIdgZJ2fc5D5jl2UlI1IMgxNb20MdxCYLOoq
 CdVvMHMsHhboLhlfIIkSia8MUJpVLFLJf01VteQU/keGqE7o9hnwq6h1WVZ4cfHhDBg3
 +8cuEDRtIQM6TlX2myfBJs49Oa7W5QjfZOZyYVvkYwsLxY9HD+s2SeyUtN+1EuxcsTVv
 8L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678218318;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8t3iNct7jyt+9VzSMPLJXt2c+9gHsFPKshnCiRgzoY=;
 b=vfNAJIthLgORWYf55bgQA+20PDWm/nyZs2YgcT91ZvfVLYZUaAXjpV9tRLYzn1gyeA
 uzcs+g+5ptpmDYbqB2xeDBdGJs2M+wXjFrXU9QIzCsDOL+S1fik2EgQ6/s9ogiwiwjZT
 cM8QZCby6DE2G3P+XGSJJqIHunOBU0h12ZGjcs2iL5mTZ+v15tKVeuYjIC8ZphFqPjrK
 /0OrDku8GzRcTDc9rY6M+zj7vlktC0Q4nuFPgPeW+mZseYdisSCf+7+8nZlTfJGOJlSl
 MDUGQyeEmiJvnJFse9H8oPgt/aj39qJ2juqwVW7tBrCDHu/rt36RbmLjVPFLjKwZSFe2
 QeQA==
X-Gm-Message-State: AO0yUKU5iAPngJpnjw5J6JlsBxcce9OhZjyq6f0wc0b4Xc2fOyDuJBVU
 HMLy1V4k0yNcR5bAdrRlz2RIAxTYuRiOAV5uh1FdnexsjSVzcg==
X-Google-Smtp-Source: AK7set+XCUdyIVLmMT1TQMGdfcGA52x2k9EZ1OM0wkGrvCw3DYSna9IyHkNOrwR0jZXi6b47ld3QJh68bw4wR/nPldg=
X-Received: by 2002:a05:600c:1616:b0:3df:97ed:ddeb with SMTP id
 m22-20020a05600c161600b003df97edddebmr3480393wmn.8.1678218318159; Tue, 07 Mar
 2023 11:45:18 -0800 (PST)
MIME-Version: 1.0
From: grace funmilola <oluwafunhmi@gmail.com>
Date: Tue, 7 Mar 2023 20:45:07 +0100
Message-ID: <CAOB_jwgeB4NB1Gw+Abu4ZoV7UdoHd+XiT=aJpr4OLKG9Uq0woA@mail.gmail.com>
Subject: 
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b5a3b005f654a6c1"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=oluwafunhmi@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_60=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000b5a3b005f654a6c1
Content-Type: text/plain; charset="UTF-8"

I would like to unsubscribe to the list pls

--000000000000b5a3b005f654a6c1
Content-Type: text/html; charset="UTF-8"

<div dir="auto">I would like to unsubscribe to the list pls<div dir="auto"><br></div></div>

--000000000000b5a3b005f654a6c1--

