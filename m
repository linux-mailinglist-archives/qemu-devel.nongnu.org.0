Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AC567FE5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:33:32 +0200 (CEST)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zXP-000257-27
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o8zQ5-0000g2-Dt
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o8zQ1-00053L-Bv
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657092352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=D1FiBsSRyDhGF8EDUd3S+NHJnvbZ/dbUXVw1gPS/HToE7g2rAJ4TapRAsx4H/XGZxOF5X8
 XpnRRm2GZLohvM2dMuUq98OijwZeRUa1ESurFJ028ezXkJ7j4KnsRSvzzVi0joE6I8kXk9
 71e7WZQ3sUFYoN/tKhHbMG/6v5IcAJ4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-IE9DhbvnP8OXS-Z6m0jz5g-1; Wed, 06 Jul 2022 03:25:44 -0400
X-MC-Unique: IE9DhbvnP8OXS-Z6m0jz5g-1
Received: by mail-ed1-f70.google.com with SMTP id
 z17-20020a05640235d100b0043762b1e1e3so11115692edc.21
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=oulW47tff4AeWqRHQVgkZUIkc3QPl9qGsK5oTviBmn/ffQLK9eOweALGUHDQ7MYqZr
 78wVxLRq+lyDDUfJ+DVIElFw0NrLP3iovroSLBejXh3tzE6Qf/BZnCep8tF9p1EHhOmC
 v5+X8e+V9giZsQT+0ufDaUR/OWABJ/rWCNVbAXfH+KOBxS2fACw/sNBHFXHitZviJ1ib
 4S0U1rp4ol1o0ETcHKEJUxqXxHRmGJ1YxP7IMtih7R0xl6vDrSmVMB68pQVyJj12nLLi
 s14htEW7x2RdrzpxzO/aD7fLdB3ckI46iasn/Eijj+iTfC9mSMLjsGhg+0Y0sndv3xyV
 djhQ==
X-Gm-Message-State: AJIora+2tEwY639l364II/zy9LAxFeJYQ6ZqqqnWERJxN4n3rqGUK3bQ
 whiJrMX9PdqGkSsztUauHSmSppMauuRP+j3WF5/E5EKzf5xZ+kX3uH6Yvg22+7cOes82qqAdSUp
 LEqJ7SbS1dz3LK44=
X-Received: by 2002:a17:906:9bc4:b0:72a:f0ae:69b5 with SMTP id
 de4-20020a1709069bc400b0072af0ae69b5mr4339614ejc.757.1657092342958; 
 Wed, 06 Jul 2022 00:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcRGfAw4sanjhFLiLS5zhBQ7shrqPrTUOI7DmRXanMuyegUgxjmRQz1qLCyzGY5yYl7NRcBQ==
X-Received: by 2002:a17:906:9bc4:b0:72a:f0ae:69b5 with SMTP id
 de4-20020a1709069bc400b0072af0ae69b5mr4339589ejc.757.1657092342776; 
 Wed, 06 Jul 2022 00:25:42 -0700 (PDT)
Received: from goa-sendmail (93-45-133-165.ip102.fastwebnet.it.
 [93.45.133.165]) by smtp.gmail.com with ESMTPSA id
 f15-20020a1709062c4f00b007081282cbd8sm16955153ejh.76.2022.07.06.00.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 00:25:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 thuth@redhat.com
Subject: Re: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Date: Wed,  6 Jul 2022 09:25:32 +0200
Message-Id: <20220706072532.359398-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705200543.2366809-1-mcascell@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



