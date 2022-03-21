Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C34E2CE1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:52:59 +0100 (CET)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKL4-0004Q9-Lk
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:52:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWK11-0006MS-TI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:32:16 -0400
Received: from [2a00:1450:4864:20::635] (port=35403
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWK10-000565-EP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:32:15 -0400
Received: by mail-ej1-x635.google.com with SMTP id yy13so30641978ejb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GtKlle4ASKp41BxP2vlyE1Y62OLmlDx2r0vsFsofbaI26Q/TGdSDLtxaIvwj3MAcTM
 jiStuGmEawU6gfL8Na5tdzVmtTyZY0zLypE5rS0qnrB9seVhywsVllHW7tyEThWvUyhE
 6PkQbUY02uSS7y83yjv3rXSSNFNdV+5+8dytmVadqVNFz8KR1E0X8ZDLb/QU+uTNi7Vp
 cuHfTGPaNShPgSFkq0/aFPF5hKCFaufUAh7bR8fVtA3GyPHX0jVXbppNRQVQcj3IpHHL
 zkchKqHJPUfBzUW9F5uuvDqiYfP4SjPIXDobHHYOZ6/G9t46GNQfNP7zltTsHI/4PMqz
 oP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=AdyVtdutb5N1VBDsaV2PshjBwTAK8BARBx5BTzUNb2FnWhY3NLxABbTY5JZQNmF0Bp
 eE5HZlH/L8wdomUtGfhVnOJvub32Bg2C4DAnVWk8Oo3rwzb/M+bv/Il3AU+HtJs73pJK
 dJvfPbgc6Q3ck9vUr6AYIrmVI8zEyYKRbsOOyvownalc8NfEg9tmi4FATP1fOD9EMUxX
 CvNj4rAwaNX4OPbZmsgKp9B7HXVZPKot9+qqfINI1Hxqm/+8Ezli/K+KGtUN7X/oy1rh
 sAnHWoQIvsjQead91Kf3FZQ+XCAlgjvbSsezYzb/sW8IaTQAuWnGP0lWfpD0Cnz1iEpO
 21Rw==
X-Gm-Message-State: AOAM531+4s+7yUce2PPiUrx4/tXQt1BFIaJh585YqYuuPFSosj+AxGUe
 nOJ4gI32G5euBiiubrwgErc=
X-Google-Smtp-Source: ABdhPJzKluJOa3N5Pav5j4R+wxXXW9S7tc5iI6LJPeg5/0GUhJ7OO7gHr1836azB0i0xp1cL4X9jyg==
X-Received: by 2002:a17:906:58c7:b0:6da:955b:d300 with SMTP id
 e7-20020a17090658c700b006da955bd300mr21098296ejs.481.1647876732997; 
 Mon, 21 Mar 2022 08:32:12 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a50cccf000000b0040f74c6abedsm7923393edj.77.2022.03.21.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:32:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: luofei <luofei@unicloud.com>
Subject: Re: [PATCH] i386: Set MCG_STATUS_RIPV bit for mce SRAR error
Date: Mon, 21 Mar 2022 16:31:26 +0100
Message-Id: <20220321153126.166053-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220120084634.131450-1-luofei@unicloud.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.659,
 PDS_TONAME_EQ_TOLOCAL_VSHORT=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



