Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF19C291219
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 15:41:53 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTmT2-00028T-PA
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 09:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTmR8-0001Yj-Sv
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 09:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTmR7-0000rJ-AN
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 09:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602941992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKtQbiURRXtRDsjJ8VMm5E1PrcafGordivpofUoygzE=;
 b=IJoJ2sHrLUBP5aOVWFyMjKfaV+7RWLMv2cLjKdZRclIXT8LlmNy9Rw2uo/jPgWnctlYoIV
 6N+y2yJFImKvMCv5LWXTGpg0zJg//jsLjemjtYWCXGylfWRxexx1DEpkbgxCLtTyXY5Ctr
 P6KERMfex0yvVPta4m397k9AGpwTq7k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-QwlvI9OAPG2aqAfw9EOMwA-1; Sat, 17 Oct 2020 09:39:51 -0400
X-MC-Unique: QwlvI9OAPG2aqAfw9EOMwA-1
Received: by mail-wr1-f71.google.com with SMTP id u15so5151868wrn.4
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 06:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RKtQbiURRXtRDsjJ8VMm5E1PrcafGordivpofUoygzE=;
 b=uIbNdQXz0CbCzBUP0imlzeMmP08Rxs5LtIf9kSV8IM6ZZ/rCTSC64KF0gHa9IqiQ50
 uoYK/rHtuvItYHJ5Qu6MaSfCY9RwdIIeIeAL7dzEfxqNYT7DEx5m52zFPgQYtKt4MB9q
 K9k81X18vhcc+6CTKDZ2M5YTVOUoIXiBFz7frkosBBFxSjR8N3ZrfRyOBd8nCgMSIQ8I
 CDVC9kMOek3Dw8Ch9OEpWLgDuvSobKuTrDCllpIj+YEmmH4aaX7oxMmgNIY0kGdx7Tsf
 5Bhn71tXZRWSzHuDT41FCXTGSplkDGitAOPnkOGUAKYc0kTNdkSiomsbs388PemNKVCx
 ZOzg==
X-Gm-Message-State: AOAM533MngZH3I3bVwyLSaqhrTnPBrhb4eArwSHFaRDzbC5s1thyFQcS
 H+y0FkwzjmLnHYwiEBHnK9EpW6dpIO3p9+eONo31OHwFYYBY+5KKxMPaU+BrXlEDh+aju9OJnke
 NFNb6XETZpd2mTRg=
X-Received: by 2002:adf:e40e:: with SMTP id g14mr9420899wrm.285.1602941989856; 
 Sat, 17 Oct 2020 06:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZgLv0a67LO5VP7DyGEYuMZcYsWafGbUWubSOn8TZFV0HpWub4vKoQQzgVqPkYhG4eoDYfEw==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr9420884wrm.285.1602941989640; 
 Sat, 17 Oct 2020 06:39:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1f71:1cc3:938:d96d?
 ([2001:b07:6468:f312:1f71:1cc3:938:d96d])
 by smtp.gmail.com with ESMTPSA id j101sm9599736wrj.9.2020.10.17.06.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 06:39:49 -0700 (PDT)
Subject: Re: [PULL v2 00/22] Build system + misc changes for 2020-10-16
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201016155331.1613089-1-pbonzini@redhat.com>
 <CAFEAcA_ZW2mq3ygzCjuphW2kkdOy4fcTzDObcyQTw0BJJgspZw@mail.gmail.com>
 <CAFEAcA8-ObJhN38VUuVtfu6n4escJzOj1hhaBhwwVX4sQOosuQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ac9cdbe-4377-1f84-822e-ef3f02db741e@redhat.com>
Date: Sat, 17 Oct 2020 15:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-ObJhN38VUuVtfu6n4escJzOj1hhaBhwwVX4sQOosuQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 05:57:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.247, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/20 15:22, Peter Maydell wrote:
> I'm updating various build machines and will give the pullreq a
> retry, but in the meantime:
> 
> The NetBSD tests/vm setup fails slightly differently:
> 
> ERROR: Could not detect Ninja v1.7 or newer

That's because ninja is apparently a chat program on NetBSD...

Paolo


