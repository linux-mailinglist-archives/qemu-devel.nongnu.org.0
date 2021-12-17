Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06B478C68
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:35:29 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDOR-0000SZ-Qm
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:35:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDLj-0006Z4-Cd
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDLh-0004XA-CX
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639747955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Md/eBAuEUbxzGbUPmnpCTAmSZlU5p+y4x6vD9pibtnA=;
 b=Vwlfnrpx76gOejmmeFMnAfLfW8mf3BieS8vizVR1De3fLkgas4Ujqpe+kzqs6BoXFfZ0d6
 a6Ez0ROUWpuRvCfIDi2jhMBlcCB35jUN0y2H+DZcZEWxyNLjQ0VZMrio9MRDGymhZY6QUj
 1txrSE5aNTF6CWxkxRC0ehGWfSe7BRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-S75Ua-QnNzqHSXXtCArVhw-1; Fri, 17 Dec 2021 08:32:34 -0500
X-MC-Unique: S75Ua-QnNzqHSXXtCArVhw-1
Received: by mail-wm1-f72.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so2965111wma.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Md/eBAuEUbxzGbUPmnpCTAmSZlU5p+y4x6vD9pibtnA=;
 b=DAojxO5n41nLUxRKNT355pz+ngZTqDl6ZnSPVfPLEqWt94PAKZH40AAVi6FW0kd7Yk
 qIKbG49a4O3TU+7vvn48s/TTr6/ufpS2SHQP/mHczlYmvvROOZuQGIHaVw6LdcqWrvbo
 jYhN0mKWO6h5pYizKX/2qftD/zcj8Hf4IaFiIIL4GXydb5nUEEYrwS4uJxG19TgAmcQ8
 c7VIsMCu+zB4WnTfAcNxQpEuu9o8JUrFPEwhbMLuuDOZ5lU0atGB8ZiITmqX+3qSnYPj
 0qpAiPPQGACYWdsAXEeozJ4/+YWXTKfMRMVCVjhUMdtm8sB128u60MjKyhfZAFt/iIfU
 UQ8w==
X-Gm-Message-State: AOAM53164XDzrGryNVsE+iiur7EtoAHaEHO4ISMfCuyDmSSJi39u86P6
 SA0QOmq4+GqYq4x/V52vbJg+dbZfuk/NHrugBRtnNICBJwhj2331usFtQC8RqlTBSRoWqw7n2Sb
 YL6acOCG9+pof6go=
X-Received: by 2002:a05:6000:15cd:: with SMTP id
 y13mr2632690wry.605.1639747953695; 
 Fri, 17 Dec 2021 05:32:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHFEKyKUbdGsONZikNUQFbAXgG0kwwccdOHHsax94J71Rdh/bqUsQIQadb2rrM5kfvBVTPVw==
X-Received: by 2002:a05:6000:15cd:: with SMTP id
 y13mr2632672wry.605.1639747953520; 
 Fri, 17 Dec 2021 05:32:33 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m3sm1009054wms.25.2021.12.17.05.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:32:32 -0800 (PST)
Message-ID: <946b22b9-3b81-33ed-c96b-14271ceafc12@redhat.com>
Date: Fri, 17 Dec 2021 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 33/37] chardev: make socket derivable
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-34-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-34-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/chardev/char-socket.h | 84 +++++++++++++++++++++++++++++++++++
>  chardev/char-socket.c         | 58 +-----------------------
>  2 files changed, 85 insertions(+), 57 deletions(-)
>  create mode 100644 include/chardev/char-socket.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


