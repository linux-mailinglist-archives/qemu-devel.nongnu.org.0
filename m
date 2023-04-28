Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC16F2043
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 23:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psVvj-0005mU-Lu; Fri, 28 Apr 2023 17:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gubicsok1@gmail.com>)
 id 1psVqj-0004nn-2O; Fri, 28 Apr 2023 17:41:53 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gubicsok1@gmail.com>)
 id 1psVqh-0004tH-5Q; Fri, 28 Apr 2023 17:41:52 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-43278f6d551so180077137.1; 
 Fri, 28 Apr 2023 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682718109; x=1685310109;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cfZRfY1LJDjhM7EIfQaKrTfMRsVxoCYAExd1aP3ttBo=;
 b=im23kQLl8tyhdT1ZySJ2rMVezFqEpDUwztW1+nEdkRNnVgJwXeyuTYt4tif5U8Cb62
 V/ZpMPPOuYoNVuy4Ov4o2s6Qt3fRM6I7QtWJFykzy/toQQBVp2J/0GfxvGq1kpViEJAC
 kWa8XsWrbDZPFYxrFNyB4MhKWOJlQbOMXuv6qqTEx/+SkvBciOouly+4kFXdzFYMF6OP
 u5aQszXP2hfHGkYfsW7VIAskHqIgpmWQ1MySh6UfQb+Q+XcGbeYJTXOl4MHOMAXJOz79
 DYHp6RECgecJEhS/VM/OzhiGWUF4t2hKyJt/Y4aPiFbkeXwmJuhl9eoyf3AIk33xBBAG
 n5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682718109; x=1685310109;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfZRfY1LJDjhM7EIfQaKrTfMRsVxoCYAExd1aP3ttBo=;
 b=QERw+jPD5jnWfMhD/pUX0KVIzrGsDVCcD6JS6QPgtA5OUubizLS9pIUolS8N+Iz4bz
 0UHRsLw/c2C1g/Wh6kC4D5jXqX1OmylAD2FuncleyZ1TRJwggiJX3JQIdkeSm3SzaBfR
 dySKSScnrowmrArygoSmzYRi04Tvm6AvZNLksj7R89jd//Q9jAAiza80T3qIk2g1+PSn
 w89qAFKH3jfJ9/XVXJgF5AELV2ibCY7UPZKI9BYVRJ6b7Dj+EysNuxI39GHBORuceb/g
 ZpiyelZaU0Ru0/Gy060KmyTTb748+8VX3IYj9FZKAIjy0wOIEY8jmul8bcnz6hUYDBt0
 xAWQ==
X-Gm-Message-State: AC+VfDyGxZdslvroJmlJ++fiA4Pri0+uo/93NmvFU4/F1qMH0VY9Dn1r
 RU8k/5YqCZZ3hC9QR1cl0NJROHC6S+eqZW7tPCw=
X-Google-Smtp-Source: ACHHUZ70+2GJPBDnCj36yIUGmuEaLdf3RQKBQZd/lzBjTMordIvyrreE/clqHadt91nTAPq/8HzkNUHEGa0nnrzP7nw=
X-Received: by 2002:a67:ebd3:0:b0:42e:6298:3901 with SMTP id
 y19-20020a67ebd3000000b0042e62983901mr3553349vso.13.1682718108848; Fri, 28
 Apr 2023 14:41:48 -0700 (PDT)
MIME-Version: 1.0
From: Nagy Vani <gubicsok1@gmail.com>
Date: Fri, 28 Apr 2023 23:25:49 +0200
Message-ID: <CAMvZUkHoH87y3FeHcOV0ATYSFCV22DJXdUV6BPY=XNL5iRZD7g@mail.gmail.com>
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
To: pmorel@linux.ibm.com
Cc: armbru@redhat.com, berrange@redhat.com, borntraeger@de.ibm.com, 
 clg@kaod.org, cohuck@redhat.com, david@redhat.com, eblake@redhat.com, 
 ehabkost@redhat.com, frankja@linux.ibm.com, kvm@vger.kernel.org, 
 marcel.apfelbaum@gmail.com, mst@redhat.com, nrb@linux.ibm.com, 
 nsg@linux.ibm.com, pasic@linux.ibm.com, pbonzini@redhat.com, 
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, richard.henderson@linaro.org, 
 seiden@linux.ibm.com, thuth@redhat.com
Content-Type: multipart/alternative; boundary="00000000000022976105fa6c570d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=gubicsok1@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: 19
X-Spam_score: 1.9
X-Spam_bar: +
X-Spam_report: (1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, EMPTY_MESSAGE=2.32,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 17:47:00 -0400
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

--00000000000022976105fa6c570d
Content-Type: text/plain; charset="UTF-8"



--00000000000022976105fa6c570d
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--00000000000022976105fa6c570d--

