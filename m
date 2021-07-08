Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F563BF7BA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:42:26 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QY5-0001OX-9B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1QX1-0000NS-4p
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1QWw-00012I-6i
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625737272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wezAkVn7TDKHBekYl6Hmqolc6hjy0BCDrUZJvBtZhPI=;
 b=ee92Yxi/yhmlP0alL/tt3MoXsXa0pSm/HXk/RA1eidpjjJHAA4h6CNg1Efgf5wgt/CNMjD
 qwPEBePbohgI7O/5REsZyO0kFudDOr6P1eZwQxUf2BUdaX83GwckfbR7FohW6OUIYdYZKf
 84/Ez+9pOsyvLdOJbGOf3pSdmNt1X9k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Tv86bbEfPLu19a-pQRx9pQ-1; Thu, 08 Jul 2021 05:41:11 -0400
X-MC-Unique: Tv86bbEfPLu19a-pQRx9pQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 o8-20020aa7dd480000b02903954c05c938so3004844edw.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wezAkVn7TDKHBekYl6Hmqolc6hjy0BCDrUZJvBtZhPI=;
 b=HPl316YxLcAl87hnJxPpAMvBZSe+8zZx9ih5SjW6lrOGQzeRoHFxWTvK7fAKkstcsI
 UQARL7+OYuKwhVa74kRVeSXq5iqxPKGJs3B3LjnUTWFH9SdJO2HQBhb/VCs5Z7n6dv5t
 T46TLqNpuzye16TBxBxQyBD1g+dHWWulUEfDyFg73FXhjtvGKcIXOwTY5t/CnHQkbILO
 c30m5i0QZ3+cB1fg0rf2iKo+aLPQkTQJ8AadrD6Am2aKIIbCN2/cbxGDcjng0S3Jqdwk
 kPtxAq4cGM02D3nPeEUYCSE2yUYwh6nniq8LRAO1s4sEyv2IlgJ+EeLS546o61sMQBSM
 Gp7w==
X-Gm-Message-State: AOAM532rlRqfpMiPOcmXsRawuIxE1msVO0aB+K/bJ5Jthb+IjK07vJKK
 +ubr5WeztR17q7Yd60rHEiarg3YBI1fvM75d+O2+YerKlgGcM6bv6t0IDJ3L3CxaIa3US/vHVI8
 PBQKqveNQOk/Pv5B9EODyv6qqhKDTouQBXdhyXMqXU63drX5GrUyEGKkC82Asw9yikPU=
X-Received: by 2002:a17:907:86a8:: with SMTP id
 qa40mr29398750ejc.385.1625737269611; 
 Thu, 08 Jul 2021 02:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBS1UQwxDSB1lQU4NFKsQx9fzqAK3ubKcRm7Nar4+UvEy5Yzpuw8aZU1cGMBNZ2eaBZDoSfg==
X-Received: by 2002:a17:907:86a8:: with SMTP id
 qa40mr29398723ejc.385.1625737269326; 
 Thu, 08 Jul 2021 02:41:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e2sm935458edy.12.2021.07.08.02.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:41:08 -0700 (PDT)
Subject: Re: [PATCH] vl: fix leak of qdict_crumple return value
To: Markus Armbruster <armbru@redhat.com>
References: <20210707121545.361829-1-pbonzini@redhat.com>
 <87k0m19nw6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c26de037-2d62-6049-fa11-0c53200d0a86@redhat.com>
Date: Thu, 8 Jul 2021 11:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0m19nw6.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/21 11:05, Markus Armbruster wrote:
> Fixes: c0d4aa82f895af67cbf7772324e05605e22b4162

Good point, will add.

Paolo


