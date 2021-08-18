Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AF3F0511
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:43:19 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGLqg-0004wm-GS
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGLpw-0004Gw-2C
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:42:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGLpu-0006UG-7u
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629294149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E2Ub71o4yZrPgy3nsoIvNqW2cIYuHOehfVQiDB114Yg=;
 b=hUWNXOuHIl4mAU9RWEdVUf4FWkywjhRlQ99HASrlGw+DcMhb+KLDnaPL5SBmWtmPag/5Pm
 rtjTXOcjRC8GjO+f6F4xEtVc0SPd+hhNTveFTEh5pbkNfgV4Ag3aYQjK10tt7FhPOfV976
 CI9+D9vRs0lNY7pLa5Qz++zlAHuww3E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-W9zpf4MfPCe-LG-iov69iQ-1; Wed, 18 Aug 2021 09:42:26 -0400
X-MC-Unique: W9zpf4MfPCe-LG-iov69iQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so882018ejy.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 06:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=E2Ub71o4yZrPgy3nsoIvNqW2cIYuHOehfVQiDB114Yg=;
 b=WLRFjmCYFWx3VgFrW6Hn3ZFIWDvNu0WrUNynR+326PpkCwIkGfgOB6yEKw9Fh9uC2T
 trbcsTfZFkqIm3Ysj6sU4an6QWw9+wNXi/YyHOJ4EVGB91QEK9m+rk+m6OnMV55bc0Zk
 vTgub+fctRdnEdqMX3s1yfIPDvfq3+LLCW2MSYMn4eCAt83hy2iRACxyO0MiH/rU2lFe
 m1270F4U5f3vKDel2OULrmYEJ0iSm83tHXZNvh3H5fy/kGGFzfzp0SPhp8P6DVs29Pe7
 DsEvHof7Bt0O/XDvi9CwKDXHyysPVhPFVDUtJHhjyyk7hivG7f0QMKwCMLqYf8O2nTK8
 YsEw==
X-Gm-Message-State: AOAM531JgqvIhWhqXHsqylkRx/AclRsQHJF982T8xiLJTl5peL9xbb1j
 t0J970OkbdgE49Z7lc+HbQOpC2VK+x/h0oU4DsF+sHb1MovRrOqJ6mvGcUTeXSLIPt90Pt4NcGm
 c4QuMIFR9RVF46rk=
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr10317392edt.225.1629294145409; 
 Wed, 18 Aug 2021 06:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkTS0b3/xVeZA+J4kbb9bXooUneZEECXUR5+olGSrhPaH+Rk76YJxsbd0FBtsTyVFMjT90ug==
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr10317374edt.225.1629294145248; 
 Wed, 18 Aug 2021 06:42:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83070.dip0.t-ipconnect.de.
 [217.232.48.112])
 by smtp.gmail.com with ESMTPSA id p3sm2158286ejy.20.2021.08.18.06.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 06:42:24 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Is QEMU's vmxnet3 still being used?
Message-ID: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
Date: Wed, 18 Aug 2021 15:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, Leonid Bloch <leonid@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi all,

I recently noticed that we have quite a bunch of tickets against the vmxnet3 
device in our bug trackers, which indicate that this device could be used to 
crash QEMU in various ways:

  https://gitlab.com/qemu-project/qemu/-/issues?state=opened&search=vmxnet3

  https://bugs.launchpad.net/qemu?field.searchtext=vmxnet3

Having hardly any knowledge about this device and its usage at all, I wonder 
how much it is still used out there in the wild? If there are still many 
users of this device, is there anybody interested here in helping to get 
these crashes fixed in the near future? Otherwise, should we maybe rather 
mark this device as deprecated and remove it in a couple of releases? What 
do you think?

  Thomas


