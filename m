Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56358480F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 00:14:41 +0200 (CEST)
Received: from localhost ([::1]:44726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHBmB-0004Aq-QN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 18:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBjd-0002Up-30
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBja-00005c-AL
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659046317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=MVxzz85A0VVNHB17OhqYEfecMjcZIGXetW3585H+AclSIHwWFCfubUB/bwPKWPUzoQJo7e
 bIU6K3uon+azxEJVlAkyGNPTMbAhAGIDr4VZziIwlB6Uhu8reM2Hq4inaWSAzsdNJY+giu
 aspqKrMjxuAmILcAOBxkPRbB7fGVTX8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-5Nbx20NyPV2MGB0dCZ2l6Q-1; Thu, 28 Jul 2022 18:11:53 -0400
X-MC-Unique: 5Nbx20NyPV2MGB0dCZ2l6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so1475960wmc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 15:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=s9cJzqAcvoiLoehEeaU1JzRdjDxBoQJUP/kngAvIPGLdpfXC1HtG8jEplGviHnrMGG
 zf3iPPARvmEyiuQ/kZ2ETtWP4T/d7lItpafGW3vnxhxx2Y2oZhLbvh7cjS/Wd1cuaaaC
 oGBUlmPpEk6srDOsbjI9hAdyoOOq9VruJaBlqm6vNiNBC2gHMTiDNEu7uRGh08/WwFry
 m32qzZzA1jR+CHjmX15tx1mlrDqYXiBj7BlUc5kddS+xhkJD5JgVxPcRL0nXEIySi796
 caux6eIwgi17sT0WiZTIwVTU+WszzUAzzo63W2kw/4D7fxBJEofhR8RUmPTLpPQK+kBR
 eNWQ==
X-Gm-Message-State: AJIora8A91CmiiROCRTqO/LN+RUQ8IhHR9rCBtRPXiP8Yg7HxLfTq6Ge
 Xm9WV6wKtAP8wO2/lhDbgN0RY2ZZTfefzQi/BvT7IVMuyPTEvOKVfT3kq5UnFEJE9/m6CQTerRd
 rimywW09zP1Rb60M=
X-Received: by 2002:a1c:a382:0:b0:3a3:2644:664f with SMTP id
 m124-20020a1ca382000000b003a32644664fmr855877wme.41.1659046312801; 
 Thu, 28 Jul 2022 15:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRPP+bb/tf4L1jYTqB1y3OTlusyqVSnZpGm7fl5OIj3gY0QgWOV1/j+5NOpYVE7f4VYclQRA==
X-Received: by 2002:a1c:a382:0:b0:3a3:2644:664f with SMTP id
 m124-20020a1ca382000000b003a32644664fmr855869wme.41.1659046312568; 
 Thu, 28 Jul 2022 15:11:52 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5d6d4d000000b0021d7ad6b9fdsm1992696wri.57.2022.07.28.15.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:11:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] configure: Fix ppc container_cross_cc substitution
Date: Fri, 29 Jul 2022 00:11:51 +0200
Message-Id: <20220728221151.304954-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728183901.1290113-1-richard.henderson@linaro.org>
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



