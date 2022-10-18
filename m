Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24E602CCD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:22:46 +0200 (CEST)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okmYO-0007wu-OU
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmTc-0004Xg-GZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmTb-0002Ur-4t
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=JLkVvBWpd+jl5oBfTDoA2kQzGgrgUMjhr0vD6mzBzN0lmmV501IkWSZKzoAyBMXdr2YVnS
 qrudNcmaIp4HbN3Vci98DT5jm3Keb4MX1O2GCk1dLrNYQot5hetm/RZBitj+JjNG6b/lS/
 Ce1CKxTDOU0pEqYBduqWN53lJCiYaWY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-6dmhgntWP0C0leFM-E1ujw-1; Tue, 18 Oct 2022 09:17:42 -0400
X-MC-Unique: 6dmhgntWP0C0leFM-E1ujw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so6351128ejc.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=HeZJTdAFkkw10lQqe+jpv/0g1Hs9gPGSqiPApuzTp+Wfsg2D2bG1/aICmQoJWFbdD4
 GMJmf/au5siLRUmZrlMCopqYhPmydSzAvyNzc+JzM5sH2T5Bm+WSRowwW6vNGzlTtDiI
 ePyxsQWhAD+E6in2FW7lN39G1WzOkj/x2KTymY1MwzhEQVAct/YkYRqo8yTOXo7ilSy1
 fC6W+8BSUiKfDBHuLrev0Y2TwCfd8K0/+uRk9jo32aX0L64QrLOVOcpnvLGl56uMwL1j
 585BEWA1tIdTtfyPvXUaOmrwYg3vyzIQ6VA/wYAQbq24RaSJHhmsmWCVXtYzd+u4xfya
 /J5g==
X-Gm-Message-State: ACrzQf2rNgIyH6pySS+KrqavLQBs7DXXp1uCnyJAeckM7aHBFwGIgRg2
 0KdClFn3gMMlp5XZ+uRrN/9jo/TmrIqxkpwVb7CPWYzrt6p9GM5umCr0Q3qXmuSXCWwYHINcdt0
 4uUc5s3kQIWJg+8c=
X-Received: by 2002:a17:907:6d29:b0:78d:d12d:15af with SMTP id
 sa41-20020a1709076d2900b0078dd12d15afmr2385805ejc.53.1666099060977; 
 Tue, 18 Oct 2022 06:17:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mINpaKJhyzHhxDivHRwi0nLp/eSRpBPNyrg8h4W2CMDvlQGoqmNFRkObu9gcYr115sZLFGw==
X-Received: by 2002:a17:907:6d29:b0:78d:d12d:15af with SMTP id
 sa41-20020a1709076d2900b0078dd12d15afmr2385778ejc.53.1666099060717; 
 Tue, 18 Oct 2022 06:17:40 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a170906305700b0078afe360800sm7543071ejd.199.2022.10.18.06.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:17:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/i386: Save and restore pc_save before
 tcg_remove_ops_after
Date: Tue, 18 Oct 2022 15:17:38 +0200
Message-Id: <20221018131738.855224-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016222303.288551-1-richard.henderson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


