Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58D5F0CD3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:57:16 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGVv-0001yp-4x
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeGNF-0007gy-AP
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeGNC-0000PY-QC
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664545693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DpjOzRkZhBa/Pg3PviSYoZR9Y8d74x7bCUGZcREGlJQ=;
 b=To+l7uemNrJeB3ACyAUjsZ0P1voT7q646/MmTWLhJEWKOWfGGycl8+TrkyRHyCPjhHmrPS
 okPJfhD4n/Kcjb7ftjKKiIHCBj8Re/lMZ+bYOlVU5jNOK0Qfm9fh7+vZgOUfP+8i+Sc+aC
 Xd+Px+dGJ2lfHiOZTjbKAR8F1Lvo818=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-kG4p9Fx1NzqkdDcUdqZv_Q-1; Fri, 30 Sep 2022 09:48:12 -0400
X-MC-Unique: kG4p9Fx1NzqkdDcUdqZv_Q-1
Received: by mail-vk1-f200.google.com with SMTP id
 e196-20020a1f1ecd000000b003a27f3f8d05so1215580vke.21
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DpjOzRkZhBa/Pg3PviSYoZR9Y8d74x7bCUGZcREGlJQ=;
 b=l6m9SBV+8ZghTihhb5sQmb8yOGUwJ5BjVrCZcISzatzuVPbMBo50KUybKI24X9hhP9
 842IX3WNaUvReGoA3SUVgDtp/LJ4SmqYjVuAisr3r/m4CHM40s+SwaYld7uimxg7byKo
 6OWe22HiJCapTNewT/jZurjdzBWbMnekLLTmpZaRAzimcOUtbXkKVq3GJPsnqO2qrCvC
 8DtuL0cafJNZ1FLdZEVfj6gIhlbp/0Kd3WocjHf4MF3wbsNFonmbtRMz/e/xCRtDIGBq
 LME16ltcHVcfCR1Q5/YMaY7KIU2wfCZNOrrXdSpesClT/ynjn9hkAF0VTIV4mWJ5hZeK
 o8Lw==
X-Gm-Message-State: ACrzQf1eAE3XBd/Wy+C8JEzxlcqtYHWGK9UaIfbLn04BkYyaDUbURYlO
 R2KzscmAof8w/AXiWLgPf/p+HEXwBMKTawdppioWQ1a6tnnZqQCIENh1JfT5+Puz0IPvxTIqv8N
 I8Skkf8fwGFz6V5BcRFaqU00j1Ayl5Pg=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr4816126uar.109.1664545692016; 
 Fri, 30 Sep 2022 06:48:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vhtNZPh/Jycdh2ezlOSfx4M4u5rOUl75wE0JiwyaW74Blznf4+PezDVtEvPLxR5PcvIeBTPEShawJ2g+X3Yo=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr4816121uar.109.1664545691840; Fri, 30
 Sep 2022 06:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135421.2515257-1-peter.maydell@linaro.org>
 <CAFEAcA_JtLJg0qfm5_rpb1K9oN7taVTTT_W+a2Uvywo5tLw5Gw@mail.gmail.com>
In-Reply-To: <CAFEAcA_JtLJg0qfm5_rpb1K9oN7taVTTT_W+a2Uvywo5tLw5Gw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Sep 2022 15:48:00 +0200
Message-ID: <CABgObfZvzr6mBRFiibkwsN0jgdzZw0kRfRNP4GOKP+yQErEDmQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-7.2 0/2] pci *_by_mask() coverity fix
To: "Maydell, Peter" <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 3:36 PM <no-reply@patchew.org> wrote:
> Ping! This series has been reviewed.
>
> I can take it via target-arm.next if you'd prefer.

Yeah, I would say just take it through your tree.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


