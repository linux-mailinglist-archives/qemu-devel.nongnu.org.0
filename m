Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3051435D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:41:13 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLFY-0002of-FW
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLDA-00026l-CX
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:38:44 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLD8-0004uQ-Rs
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:38:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id a21so8099942edb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=owz66GH8sHuTY/shCXBtIhCZYhhwI8BKkEXjlnKmeA+2SOWwA9sdWTmRFZUaxpsDjH
 kv4mNkDwq3BzBB5sQJ+6riPSBbVPtXgDTCYkIMYCedxv3Sf0YUODtZxy5oPjIFxccjSY
 HAwMkVthMsdkY2vBvCih3Hv1kmsTc6RJkbSlYCKMkQW8x0ndb8B1ebSMfegpag5BE6Gc
 K1UjKmsKslTjNVdfvvM3UzqJnipvVuQfRa/OdIs5ZtAtiT337srb/zNlBQ7vwMArn603
 BzhwkEc2t7bb9nYbCAWVnFFP6wNp5dhUrVQ3jwtPAQfgVJSQgLnPy6/8RXt3lHE30/vT
 oKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=n+o42oxX3o5s73zcynOZIxPEAzmE0x49Z6dk4lIkxHLYtoZS4FicE+BNZUQyDoET7M
 cq/uES/uMMUxpIhDeI53xNTE0b4HjmzGJUe2/jkfL+Jy9zFMvcnH8Ba296wHZIRzrlt1
 blJdUtjffbVtc8EZYNXK8iIFMX4k61n3KZthRjVxUr5WnzImE7A1liADmsuHCVCMMYZP
 0XYx76IFrCc6oL+iaY0z40elX6DrRaQVqIy+uZxzBt0UC/N9zHbtNeUWnIvu71mLh4Ga
 o+54PLEmNhlseLPcoeGDYQuH2RGhnnRGZxX7WvaCt0KaxD7h8zx6MUJBGjjowNTygvsM
 ITog==
X-Gm-Message-State: AOAM532E14dBlo0kPulsSHh7x5ltx57QfezVHzBcolM3Ig5cP+YOTEyE
 TIoffuEI3xFXKgvZX8xe3mE=
X-Google-Smtp-Source: ABdhPJz87+xnLZHOi6AsqLRLIdY/3LUhSmYppTwfFQMkDmMU4n1i5KtGoVQvyVNOt9HLiprGLJh7pw==
X-Received: by 2002:a05:6402:948:b0:425:ea37:96b8 with SMTP id
 h8-20020a056402094800b00425ea3796b8mr24964367edz.90.1651217920610; 
 Fri, 29 Apr 2022 00:38:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jl26-20020a17090775da00b006f3ef214dbdsm381122ejc.35.2022.04.29.00.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 00:38:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: Re: [PATCH RESEND 0/2] build improvments
Date: Fri, 29 Apr 2022 09:38:38 +0200
Message-Id: <20220429073838.291442-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429071326.324497-1-kkostiuk@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



