Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794682C68D1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:39:09 +0100 (CET)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifq0-0001ei-HH
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kifgR-0002hZ-Vx
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kifgQ-0001KN-8G
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606490952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQjo2OiA95mpj40kn87khodSABSB35YOkpXM0UNm5IU=;
 b=GhWLl+orPJB2PymOFeJw5HNBWcmoUcBYBGPDp9vlgs9FeZyY1VYhIC7eacXPkO6GRvNee8
 EGYQQy8DHzmHZnbi+78klGThLddB/W/GBlML9hCk8vN3KyD5ose3MJZkHBvoKfn0Y0H9cb
 75AszZikofrHeOdy4NLloBS6JpodUOI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-EWsG3xSmMoKDldu8KsN1Tg-1; Fri, 27 Nov 2020 10:29:10 -0500
X-MC-Unique: EWsG3xSmMoKDldu8KsN1Tg-1
Received: by mail-ed1-f72.google.com with SMTP id f20so2539312edx.23
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eQjo2OiA95mpj40kn87khodSABSB35YOkpXM0UNm5IU=;
 b=HCSeLbbI+OSKWgM9ZmAAo/3JM0i2IUmoFtcFlwIUAgmVcpKYL7KSyTac1E3Pp9jSAt
 8+zjxxsdU1umDy/V8cBFKsHHWPz6goKQLlB1Icn0OP2eZs/6lHTro4AlphKHitbbK2me
 M9Q/S34RB7l8+9Ojc+086IrBU6WXRkpH+MsQbA674quwH6G+o/DGEuzFP5WMUQ+zXHfC
 HVta973tvXLMGvd0M5DUNGpFYw1eudVxNYv7FkhZ05t0xgfz+Ur/Zm6EksQww/6jMQl+
 aHQMjB0QAOg7Tbksjb3LHQvKzj/bk0M3Qq8kJtNw3JMMVVUlu7CqbCycRXdPTP4+ugfy
 dYKg==
X-Gm-Message-State: AOAM530fkiPWOt3YNv4jVq+B9jaI6QyJFcB3xN37bZjTpZtTWWG4zgH3
 AnUtOCX0Ge9LNMl+18FjwpCIt9MD8YSnf4fssgVL5ca+1GtJ9MjH6CMUkCKYdPD+Tn5DMDcKFBe
 HuNvlmc3ebqQK6xBotaCXnx71u7EzR1VsvpHnH1DEZ5c0goXXW3UODe+EbVHCNlSBzhM=
X-Received: by 2002:a50:da08:: with SMTP id z8mr8279271edj.170.1606490948346; 
 Fri, 27 Nov 2020 07:29:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5EHdBmPeNsThxy85ZwSnfXUkehHklYyMnlbPU/G1RRRrLUcYuTy7pIdliw6cnVzQCO5a3qQ==
X-Received: by 2002:a50:da08:: with SMTP id z8mr8279241edj.170.1606490948098; 
 Fri, 27 Nov 2020 07:29:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dk14sm4950354ejb.97.2020.11.27.07.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:29:07 -0800 (PST)
Subject: Re: [PATCH 37/36] machine: introduce MachineInitPhase
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201127120021.3221679-1-pbonzini@redhat.com>
 <20201127142910.5a921d27@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <763b40ab-2498-2d37-65b9-144b49a8db0e@redhat.com>
Date: Fri, 27 Nov 2020 16:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127142910.5a921d27@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 14:29, Igor Mammedov wrote:
>>   void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>>   {
>> -    if (qdev_hotplug) {
>> -         error_setg(errp, "The command is permitted only before the machine has been created");
>> -         return;
>> +    if (phase_check(PHASE_MACHINE_READY)) {
> that's what I was afraid of in 26/36,
> it should be PHASE_MACHINE_INITIALIZED
> 
Indeed it should, and the same goes for qmp_x_exit_preconfig.  Also, 
it's probably best to add a comment to qemu_init_board, like

+    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
      machine_run_board_init(current_machine);

Paolo


