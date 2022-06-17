Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D738A54F220
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:44:31 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26ec-0003n6-HL
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o26an-0002vh-BM
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o26ak-0005Sk-0q
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655451628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G0bz3kY3WoKmbiXw33c+pHHBtfYzE5Sbcms58MtQFo=;
 b=MI/p7jF/GVcv0Sz4yV2LdMMPAjhl0g3NWqefX4FNWUxGWvXcuZ8GDNR4/HnYxe0Ns2YY4P
 NPrNYhHVYESYxsudkClkmFxzGP1tZhEzhfsJGvAa0rJYnfFpqkntFLipWUYBoadft0Lqp+
 XFybHh5f7hoWchTaaUkDl7aDrTum4X8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-_RG9NaToPWWGvSnHzxfW3g-1; Fri, 17 Jun 2022 03:40:25 -0400
X-MC-Unique: _RG9NaToPWWGvSnHzxfW3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 w8-20020adfde88000000b00213b7fa3a37so736603wrl.2
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 00:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0G0bz3kY3WoKmbiXw33c+pHHBtfYzE5Sbcms58MtQFo=;
 b=w3kJ7Rtc2gdK2SIZgDMFSsOSMI6WB+1tU3p9kPCgMUldVAMiNARGQdrqX18oaTkbYq
 cTRs5crdPaOC5K1+5TB4TWaTRe15KEyYV89jjctWZ7AYWr/Ew2fn9+7spJO32yqTg4J5
 Y3oY9zC9ioprQCeBXuOQmxabrjIAxNT2U9w0WyhQD3599e6nFRULzZ0yNU9UEAtSGT/v
 Kf5NZlLiV87CfAzEw8wXIFtb0Y6sAKQssYmoS8arPNlZ5k6OVF7/Gz8QvpAeTBBYRTo1
 0sEXyMKPRVS/uwn2RpK0gWSX/hLcABlOfkdgimw7TDEp8HOpEHjBRPDSfaGHLi5PsjIx
 1gOw==
X-Gm-Message-State: AJIora/I7HVf/GmvRaIZ5++IaqMlOpHhtzh0gKN5gbe4Md+M6WaaZpZA
 cH1XbsZx/tb77QOtxKiZj5O5oDXB9pJucVfRkfU/EYd/nz5rzcnk4KBNVaAhBJL2hFfvOAKzpfo
 GM85drlLlbuODHbg=
X-Received: by 2002:a05:600c:4787:b0:39c:8576:8f55 with SMTP id
 k7-20020a05600c478700b0039c85768f55mr8495022wmo.1.1655451624662; 
 Fri, 17 Jun 2022 00:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZmlr7/0UBMjqq/SSZ4OHd3FzareG1q290/03mbZQES+j7mwmIo3V5kDIsO1cHTh0bKRuZXw==
X-Received: by 2002:a05:600c:4787:b0:39c:8576:8f55 with SMTP id
 k7-20020a05600c478700b0039c85768f55mr8495007wmo.1.1655451624414; 
 Fri, 17 Jun 2022 00:40:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b00397122e63b6sm5057031wms.29.2022.06.17.00.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 00:40:23 -0700 (PDT)
Message-ID: <bb340919-94e5-ff28-3f50-15da59cf4e7f@redhat.com>
Date: Fri, 17 Jun 2022 09:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] tests/qtest/i440fx-test.c: Enable full test of
 i440FX PAM operation
Content-Language: en-US
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220616100530.716590-1-lkujaw@member.fsf.org>
 <20220616100530.716590-2-lkujaw@member.fsf.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616100530.716590-2-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 16/06/2022 12.05, Lev Kujawski wrote:
> With the prior patch in this series adding support for RE^WE PAM
> semantics, the '#ifndef BROKEN' segments of test_i440fx_pam can now be
> enabled.
> 
> Additionally:
> - Verify that changing attributes does not affect the initial contents
>    of the PAM region;
> - Verify that that the first new mask is written before switching
>    attributes;
> - Switch back to PAM_RE after PAM_WE to read original contents;
> - Tighten logic of the !WE write test because we know what the
>    original contents were; and
> - Write the last mask before testing for it.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
> (v2) No change.
> 
>   tests/qtest/i440fx-test.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


