Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C009E4CEEEB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 01:15:42 +0100 (CET)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR12L-00052w-Ap
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 19:15:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR10a-0004MU-Q4
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 19:13:52 -0500
Received: from [2a00:1450:4864:20::42b] (port=37780
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR10V-0007QZ-Rv
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 19:13:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q14so5201145wrc.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ozMp5rzXMEAHcl2Pk33PF4ER/L0fON4NGa8B2E0PfDs=;
 b=TImg02SP9MFhjj4i/W9EZZkEHTNscu156StazP9yxHVHcEh9GmHbGxv+jB+7JWIiN3
 yZFlHXSpcmVYOY+MYSp1yog5cecpvFdB3voBwKBuTmPpH7HzeVVgd6npzq6QXuPxqX70
 qASXzX+q22GdyA8ttPBUVtr/qS/2Dc/ACTOU4QKgzJlC2viQuK5F8wQtuM6hJ9Gpd9Dh
 dx5KFib/QpBrl63DU5GbndUsC7gxwYuyW/yCXomHs4lItaDaQrI9ZqYDGDFWcOANfB6L
 m3E0zDi8fW64CS2AiFr3/ymA7L4jC4Z1eUu7o9S0GbDii+hO7/lPjtgy4MRSGqof2G5T
 BnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ozMp5rzXMEAHcl2Pk33PF4ER/L0fON4NGa8B2E0PfDs=;
 b=PMsUerfnewLK39eYoDIsEmbS/gASNGoS+Om3TQB38JL8TQiffkUJDXhH17rO8zKOXC
 MSiyYivjiWyJx3VR641ZXb5qphXZRmPeL7oFm9YtFA3YxfTyuHmciOllwcHfqkROZutb
 MECk5nvoaIQguCo1JgzHQPnzglISQrhYqvE9AtTWOGBjcXVN6+bJOU1U/BffEUwPrWd1
 Dz23qYszEFVMT5kUvCngCc7hhDI8hqsyqOPpIBLA5DQwhmyJHMKn3pFSIiMZrBRxij4W
 PX2UW8vSbstUlxNEaOs+Rmh5iDEkJyRZ3g8ml7+VSaeUiDNA+ln8wJOOfXtMTYFFs6ny
 V43g==
X-Gm-Message-State: AOAM532wEVqF5gmt443ihfYGd7DjCS+Nl1THaYUL6xnkDHGrGWUXRp7A
 hIrpuc1j4Hgd5tIsosFcl3s=
X-Google-Smtp-Source: ABdhPJwzAfU+NJEZVOyiodzs2ILq5r/UD1Y4ewhXQCcmZ93BWlQZALaYyXiHoDL54CmYxuyy+SNIVA==
X-Received: by 2002:a5d:48d1:0:b0:1e3:2401:f229 with SMTP id
 p17-20020a5d48d1000000b001e32401f229mr6444797wrs.694.1646612025867; 
 Sun, 06 Mar 2022 16:13:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t184-20020a1c46c1000000b003814de297fcsm5629264wma.16.2022.03.06.16.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 16:13:45 -0800 (PST)
Message-ID: <5990c4ce-9882-6c96-c19d-830f343ae7ff@gmail.com>
Date: Mon, 7 Mar 2022 01:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] [RESEND] docs: Add spec of OVMF GUIDed table for SEV
 guests
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220103091413.2869-1-dovmurik@linux.ibm.com>
 <YdSM8wFu4xiRcKMt@redhat.com>
 <acbcbb8a-3b50-a380-ad58-0d1545c8715a@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <acbcbb8a-3b50-a380-ad58-0d1545c8715a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/2/22 07:21, Dov Murik wrote:
> On 04/01/2022 20:07, Daniel P. Berrangé wrote:
>> On Mon, Jan 03, 2022 at 11:14:13AM +0200, Dov Murik wrote:
>>> Add docs/specs/sev-guest-firmware.rst which describes the GUIDed table
>>> in the end of OVMF's image which is parsed by QEMU, and currently used
>>> to describe some values for SEV and SEV-ES guests.
>>>
>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>> ---
>>>   docs/specs/index.rst              |   1 +
>>>   docs/specs/sev-guest-firmware.rst | 125 ++++++++++++++++++++++++++++++
>>>   2 files changed, 126 insertions(+)
>>>   create mode 100644 docs/specs/sev-guest-firmware.rst
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>
> 
> Phil,
> 
> Can you please add this to your queue? (I assume this is yours
> because this is documentation of OVMF-QEMU interface)

Catching up for 7.0 I see Gerd merged it as 0a2a40da4f. Thank you Gerd!


