Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6B3B96C2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:49:25 +0200 (CEST)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2ge-00066E-29
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lz2fX-0005Kg-Sg
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lz2fR-00023l-MO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625168887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHncT7m9Wq/D3Ci1osJ3XJCW44hmjskAh+Vbhfceq8Q=;
 b=HX2i6L2CUXXS/czmWGMEroipHWcAhDpAHEAB1GaWIdIURbLP8OpsbQdOHU1pFir44bXCpP
 w7LGBleEAYXIVhl9RVHFT3wVtBBKc6r4QTHpcxUsPhYUUFYE7lsKAPdTC6a/yRHxKg7d+d
 C6ZAAqbZojkJHZN1l8AhM0HG5FGepu8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-idvCpEaHPHetnXej53UI4Q-1; Thu, 01 Jul 2021 15:48:06 -0400
X-MC-Unique: idvCpEaHPHetnXej53UI4Q-1
Received: by mail-pf1-f198.google.com with SMTP id
 s15-20020a056a0008cfb0290306b50a28ecso4710976pfu.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mHncT7m9Wq/D3Ci1osJ3XJCW44hmjskAh+Vbhfceq8Q=;
 b=fENsSH9abTN+RQ3ZTqD8HWpBgN2fd+vHbLeehwOYg38yNJN1puXZPZaI7vlnCP+wT4
 CZmjDyGFLqP+4sQiA2T25/byZ6F/gPcgtfYH/U6azZSoMRrnPx3Ht4mJX+Y4f7Zxhey0
 ZoSb85b/K3O40k/DD6oPx+ufRJ8S4oc3e1A+XPJmmVZ6vpkS9RE0PiVwzuhra/zK+ZMq
 MtFHMV+jpeVxb7zoXL2hY+ITNjbY9heV1OK0rWJK88KU9p3xvhzsVV1IoVCzW0R6SXzj
 tSR1sZxm7wU28d46ZVVPVodlKMmS97W43OjLOCt75aB0QXVUiNWPos0CLBuxX4aQHPIj
 TZ6w==
X-Gm-Message-State: AOAM533xb83Ydci7gXDYuEBTJsM6mJhMyERjA07vrC3tgCNhXuiLJ7oG
 5OqQ0B41lVK98AlLdMImlI1AjUQLPefjP3eBryDE6kwbyvxN0odhqFbWipq1BPafFkMhTG2OEiZ
 ZSdqyx7woZpL0s41z7+sIeqc7Jg8bKNbfMShxjFHcS4fp3SmMt9o1l+U5sZ7Jks6B
X-Received: by 2002:a17:90a:b94c:: with SMTP id
 f12mr11220513pjw.58.1625168885160; 
 Thu, 01 Jul 2021 12:48:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOjOwIXYnMbuZE18lfY6IA4PHe9KuuWOYAnS4K7dxZv8nYAV4pZau/EYRUwZfd0qsMwB5bHg==
X-Received: by 2002:a17:90a:b94c:: with SMTP id
 f12mr11220487pjw.58.1625168884738; 
 Thu, 01 Jul 2021 12:48:04 -0700 (PDT)
Received: from ?IPv6:2601:1c0:4600:3f84:cb33:5075:e7f0:7862?
 ([2601:1c0:4600:3f84:cb33:5075:e7f0:7862])
 by smtp.gmail.com with ESMTPSA id b3sm825046pfi.179.2021.07.01.12.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:48:04 -0700 (PDT)
Subject: Re: Contributions: Adding New Devices
To: Federico Vaga <federico.vaga@cern.ch>, qemu-devel@nongnu.org
References: <20210630140102.ecuyxyeqnthvausb@cwe-513-vol689.cern.ch>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a394439c-0e82-b915-2e49-70ceda3d7b02@redhat.com>
Date: Thu, 1 Jul 2021 12:48:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630140102.ecuyxyeqnthvausb@cwe-513-vol689.cern.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 7:01 AM, Federico Vaga wrote:
> Hello,
> 
> I can't find this information on the website, so here I am.
> 
> I developed a QEMU device that virtualises a PCI card that we widely use at CERN.
> But this card is only used at CERN.
> 
> Clearly, having CERN specific devices in QEMU does not help much the qemu
> community, hence I maintain an internal QEMU fork.
> 
> But, I was wondering what is the QEMU policy about contributions that are known to be
> used only by a handful of people (one organization in this case)? Are they accepted?

Your first instinct is correct that it's unlikely that the community
will be able to maintain a device if it's really so niche as to only
be used at your organization.

However, if you do decide to try to upstream it, it could only help
your chances if you or some of your colleagues agreed to maintain it
for the QEMU community. This mainly involves adding an entry to the
MAINTAINERS file where, if accepted, the expectation is that you'll
be reachable within reason to review patches, make pull requests,
help discuss bugs in the subsystem, etc.

Sorry I don't have a concrete "yes" or "no" for you; but I'd recommend
giving it a shot if you have the time.

Connor


