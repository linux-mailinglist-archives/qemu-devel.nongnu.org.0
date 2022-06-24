Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EF55953A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:20:46 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eYW-00054A-Ok
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eV7-0002Nm-7h
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eV4-0003qI-9y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656058629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=UvDvuzJ6aVEM7/TR6f604tJ9f7ptGQdZVaJnKeZ/GXlYWAEFEqzeHIKIN6kRpTt/kWioLy
 9tDGFqzZmLD6D57if6HqmHde/kjGfswiPjsgREu/uQl2VbY6KSHRn3hPvVKL+u0T2zTpCq
 5gdUkqT8l0FH+/iUrEYc3zduAVFKApQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-iLwm6CO_OkeAk0Ah1eNBjg-1; Fri, 24 Jun 2022 04:17:08 -0400
X-MC-Unique: iLwm6CO_OkeAk0Ah1eNBjg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i9-20020a05640242c900b004373cd1c4d5so571227edc.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=b17rNISMlGLm/ZzzDfYYTkGY4GvMVhBMMwNxYww+JpG1jjvTkmeegmTJWYDGTGjIdC
 JecdKwnWFU3Gcx3f1jNBWwpExX9bNugpoztwAolg+hOdKkTX27r0eXYhuc/r9BfhviSw
 V3Rou8CgOV5P+LNcZv/euo8XGqxy5NkKI6q/LPhz5RqYzvvhaSBafD9rKrWp5+yx4AxQ
 wMay90ulvXJisftV1jNwrGgxmALCjYEmIwCIsTuy1L/9Ofzz6vIqnAOmlUrtaSu7L4Ld
 +wf8gIxUaNeOqjhHID+lAYWN3SuVjdCqmoXQLHDi2XpukzoQ9p6mfipl0kE0UMmsJ6i7
 ooTA==
X-Gm-Message-State: AJIora8cYIu4jcw52GxiMImWXBUUkuWdFEoOJsK+qllwEehCIivwtPBe
 I3+vMdfrzfEfS4iZtwfBT2aGJNM0AldtJZ5yly3MtjgP1RqrmW+YAl7LwXmeAz7eeaEQ3GcB22x
 13+Bs2Kk4giJqfGs=
X-Received: by 2002:a17:907:7283:b0:722:e541:f157 with SMTP id
 dt3-20020a170907728300b00722e541f157mr12174576ejc.269.1656058627225; 
 Fri, 24 Jun 2022 01:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1seqQl+xXIQTDFvY3mdDv8k2SY+lZDVf3+BUyCTL44UUyP9CAySVaWSz5zQskphpJY/2xkZHQ==
X-Received: by 2002:a17:907:7283:b0:722:e541:f157 with SMTP id
 dt3-20020a170907728300b00722e541f157mr12174560ejc.269.1656058627015; 
 Fri, 24 Jun 2022 01:17:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 bu23-20020a170906a15700b006fec56c57f3sm688150ejb.178.2022.06.24.01.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:17:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] audio/dbus: fix building
Date: Fri, 24 Jun 2022 10:17:05 +0200
Message-Id: <20220624081705.245417-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622154918.560870-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



