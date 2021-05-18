Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF08387CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1rU-0000EP-B0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1lj1fF-0001Hx-UE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1lj1fB-0001m7-MD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621351779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cQ1gmsXlSainuBGROvMkucrM4xQjOY+pyqYxXgIQMxA=;
 b=XTdaV3QewLvlRLtNpcrzhR5NdLT9yy6JyEpnijHEA2QpcR7BzedLt/pGCfRfplL95GXvXZ
 3HUInktbnB4tE/24WegZr3C6fOaXnN0hIjZNwEiMvUSWcqkux9zXhnrMQHH9/F+1R1LYai
 3Xo9MfpmMRB8NhprmtQPDrQICZQlAD8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-8jGlJgJuNw6K8JFPeJ-fCQ-1; Tue, 18 May 2021 11:29:36 -0400
X-MC-Unique: 8jGlJgJuNw6K8JFPeJ-fCQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so663404ejc.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 08:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=cQ1gmsXlSainuBGROvMkucrM4xQjOY+pyqYxXgIQMxA=;
 b=kmYdbGfag8kVqcDepe0VosUqB4RvyJLMAMvhz/jtZsnqrABC/cNyxKbQgaZHv88Fpo
 RoBCSbVLcal487eAfihdrym1EERWj9Pd9MDCnMjQ83QZKxTIiYrfeMTyn4wGHvuKEYkL
 QZSLjUsyWJUriPmtKBppUq/DRED43dVcoXgx5wCqb3nm2gznj0vxY9/u17eOUDuZ+e5i
 wIv7P0B5g6sVgtoqudKrns/ZnXA+hWmdaD2Sdijl32+MzWPW/hoNCLnMRP2/OtFIsqeq
 wmccCLAfe2nbuIkFrrCqxstNm7pLQqjadXw7AwFv//pw1vGFstO9jnHDW8I150iBH2yq
 2BWg==
X-Gm-Message-State: AOAM5316BFn1kl54RLWYpkELN3n9tQRWVhHVEl8OxhbAK+qjos7w9ocM
 QLcCPDaHLT4IgKf+FkSNg6ZoF2VHj2a971rC95FfsSrlF4qA/tgSHNtUdcehSwiQTUyPexxKfLF
 fFyzTytRS+wGWbJE=
X-Received: by 2002:a05:6402:3511:: with SMTP id
 b17mr7704539edd.71.1621351775510; 
 Tue, 18 May 2021 08:29:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIy7pLecEsbkRTL7cMyYfvrGrvXF89ebNLllKQUU+1g1f8dOCAKa52vaI32yZ4AnSReB8g4w==
X-Received: by 2002:a05:6402:3511:: with SMTP id
 b17mr7704512edd.71.1621351775322; 
 Tue, 18 May 2021 08:29:35 -0700 (PDT)
Received: from finch (cst-prg-104-62.cust.vodafone.cz. [46.135.104.62])
 by smtp.gmail.com with ESMTPSA id hp29sm10206130ejc.47.2021.05.18.08.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 08:29:34 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: "Liu, Jingqi" <jingqi.liu@intel.com>
Subject: Re: Adjustments of NVDIMM devices and future data safety
References: <87y2d0gjw6.fsf@redhat.com>
 <be4c2ff5-9de9-1843-fd1f-1295e64fd68a@intel.com>
Date: Tue, 18 May 2021 17:29:33 +0200
In-Reply-To: <be4c2ff5-9de9-1843-fd1f-1295e64fd68a@intel.com> (Jingqi Liu's
 message of "Sat, 8 May 2021 15:30:15 +0800")
Message-ID: <8735ukhxgi.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mzamazal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Lai, Paul C" <paul.c.lai@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Arik Hadas <ahadas@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Amnon Ilan <ailan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Liu, Jingqi" <jingqi.liu@intel.com> writes:

> Hi Milan,
>
> On 4/30/2021 8:18 PM, Milan Zamazal wrote:
>> Hi,
>>
>> I work on NVDIMM support in oVirt/RHV, I think other virtualization
>> management software built on top of QEMU may have similar concerns.
>>
>> When a virtual NVDIMM device size is specified, it's not necessarily the
>> eventual NVDIMM device size visible to the guest OS.  As seen in
>> https://github.com/qemu/qemu/blob/v6.0.0/hw/mem/nvdimm.c#L117, QEMU
>> makes some adjustments (other adjustments are performed by libvirt but
>> that's a topic for a different forum):
>>
>> - NVDIMM label size is subtracted from the NVDIMM size.
>>
>> - NVDIMM label is pointed to a certain memory region.
>>
>> - The remaining NVDIMM size is aligned down.
>>
>> There are some related potential problems:
>>
>> - If the alignment rules change in a future QEMU version, it may result
>>    in a different device size visible to the guest (even if the requested
>>    size remains the same) and cause trouble there up to data loss.
>>
>> - If the layout on the backing device changes, e.g. a label placement,
>>    then the stored data may become corrupt or inaccessible.
>>
>> - I'm not sure about the current QEMU version, but at least in previous
>>    QEMU versions, the resulting size is important for memory hot plug.
>>    The NVDIMM alignment size is smaller than the required regular memory
>>    DIMM placement alignment.  If a VM contains an NVDIMM with the
>>    resulting size not matching the DIMM placement requirements and a
>>    memory hot plug is attempted then the hot plug fails because the DIMM
>>    is mapped next to the end of the NVDIMM region, which is not
>>    DIMM-aligned.
>
> Can you explain the details and give an example of how to reproduce
> this issue ?

I rechecked it with current QEMU and several different NVDIMM device
sizes and I can no longer reproduce the issue.  So hopefully it's no
longer present.

Regards,
Milan


