Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EA304539
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:27:08 +0100 (CET)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4S7P-0004zv-HN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Rz3-000710-MU
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:18:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Ryy-00013B-3g
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611681502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nof8IdLrTxVaL/tx6R5htDiAQ8WfOqafWYYKwtoUQQk=;
 b=iVm+1MW/A5f6ZnZeGiU1sVi8V3qv9/qIurBI0At58BFwADP5wSN14wu37fwqhuw1e1MC8a
 ESl90dmwpd8yVds5C/3h7YWBMprzKHKaIb+TDhkG73GmkNjtpZgfA4paQ6FuYaoypCpACu
 mwqsurJLLmww4RSgGF48W9GAoSActPk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-5LIlc2flNy6zc9Aokw82eQ-1; Tue, 26 Jan 2021 12:18:18 -0500
X-MC-Unique: 5LIlc2flNy6zc9Aokw82eQ-1
Received: by mail-ed1-f71.google.com with SMTP id a26so9782619edx.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 09:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nof8IdLrTxVaL/tx6R5htDiAQ8WfOqafWYYKwtoUQQk=;
 b=bPb/4bsG7tG+BWQjzYeFtABCOzxMAJH6nb2Kr+f/6JNpCYIKw46sQn6zgkBuqgkNL3
 2sO/qo4mOcdFKVYfGRxSoTuEaXoSWAAY73HjArar+gUdySgP188NxMYqgnIRCTpxbbuw
 Oih1QaIOQ2KL3HcU4ls+tkjvQa/LnPnooHaPOYmAymdqcdvnW9wzsswP9NS8kjU63CG7
 Ui77Cf+/9DSIi/u4qnct2sKArdujjF6uQ0LKQMgJshyStuf3GrEQRlilFIFeGmo5vhGE
 9h0rgjLwWQ+z5+J3mmDA4FL4a7+6Db3PoByu5c3fPkNnzt9Hdr0oHTDC3BDfQpVIFcDU
 MRzg==
X-Gm-Message-State: AOAM530btEVa9m2n309llNY0YdkT4otp0n1SDt70QSG5lTMA1tguWliw
 n8Ve6A/G5XhqoOPkATolFs8a62MuPpdsfK0sYNiLa5/69DxMelNR3ttCpKtsDGY1dL+qj3+1L+5
 WjtLakpLKjDVL25Q=
X-Received: by 2002:a17:906:99c5:: with SMTP id
 s5mr4173020ejn.236.1611681497260; 
 Tue, 26 Jan 2021 09:18:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsIt0ePa151I+zh8Rc0nKVJkyzzkW03zZ9EAgjxV6dKtJcTYrF5+uTQAXpFuZFMCPy9hY9zg==
X-Received: by 2002:a17:906:99c5:: with SMTP id
 s5mr4173007ejn.236.1611681497082; 
 Tue, 26 Jan 2021 09:18:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z20sm12790614edx.15.2021.01.26.09.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 09:18:16 -0800 (PST)
Subject: Re: [PATCH v4 0/6] Qemu SEV-ES guest support
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <cover.1601060620.git.thomas.lendacky@amd.com>
 <30164d98-3d8c-64bf-500b-f98a7f12d3c3@redhat.com>
 <b0c14997-22c2-2bfc-c570-a1c39280696b@amd.com>
 <946ac9e2-a363-6460-87a0-9575429d3b49@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <137ad1f2-8411-c0cd-4621-611d7f5d72d2@redhat.com>
Date: Tue, 26 Jan 2021 18:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <946ac9e2-a363-6460-87a0-9575429d3b49@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 18:13, Tom Lendacky wrote:
> Also, the new version will have a prereq against another patch series that
> has not been accepted yet:
> 
>    [PATCH v2 0/2] sev: enable secret injection to a self described area in OVMF
> 
>    https://lore.kernel.org/qemu-devel/20201214154429.11023-1-jejb@linux.ibm.com/

David reviewed it today, so even if a v3 will be needed that shouldn't 
be a problem for SEV-ES itself.

Paolo


