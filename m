Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD006A80B3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXglV-00069y-SZ; Thu, 02 Mar 2023 06:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXglS-00069j-Kt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:06:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXglQ-0008Sn-Ht
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:06:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id h14so16121797wru.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677755178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64KAXUBGJqjvhroHU52eBNYyDBJrllD0A9oLg65O7a4=;
 b=rRqZ5uhN3p3W8+K7PLoZtqZpO37TRhJJ9JopZJl/eGzhYnQygviT+nyuVbX/xx6d99
 kOe0u2HkJuUDW1hVRYLWGnBeowNaA1n7vEUIxNijMUTWLrB1Q4MQDO2R1Z5ZZYoteDKG
 supx1I5t6VPpE/UH/+Xq3xGKZ68d9KHLCZknEEgWn9yyyRjwkY8cF5QWnO4X1QGj+oBv
 32+K5BXxN2qCFQAVzDLQ3PAP6lWcyRomJp5ENk/7oLuAqiTaQVNNiEzaFAVFqHUgSZBY
 /HUhI0Gw1mG7XZL91sh+ZnTN9BsMJcp3p/T6/W5hSebk0Ai3J9QvGGrngrnOn1mwfCtd
 XpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677755178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64KAXUBGJqjvhroHU52eBNYyDBJrllD0A9oLg65O7a4=;
 b=GM2M0aiyHPwQ686NctPFPMASml7yoPC/W780s7QuY3mgXDLzMyOoM+9Vwbvz/YH92U
 ae1Qt4VrLNZmXSLe+Qp5CHSC/Yg5g/j0EW5xP4YtzPGbM9k2OvIifHGpeRAunxvhSYBG
 dI9JOVk5fUvJ3CA6y9iH0DkYDq6XvXaG/Wg2ez+5y0TbfuhBiSXSJL1KEKRdJ0HEjblp
 DOaZZDFE7jbE4zy7ycslG3zBbp1RWVEGqI8hWrTEyAxg4Ww+5HTCt8db1Rzj6HvGAVOQ
 u/8dxflV3LiR4jiBOafRY1hDb9naSwxCl6w7s/YtruH0Z6yMaXXJbI+hKobpQFgF1NwD
 rsXA==
X-Gm-Message-State: AO0yUKWgVc7hVH0a3TmCdBYX3wojwSKMUHWqYATNRHOnAsWyRO29MlAc
 k6q2wAIj3iyj0uMclV9Z8EkAXw==
X-Google-Smtp-Source: AK7set88ZOb8EGmLtO6cZp1yAf2t6ML/l0dGIWKlSOGpNoxKDlkT+zCGbYUb7RIMnuqJz2YuSeZKGQ==
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id
 i13-20020a5d558d000000b002c70694aa18mr6708893wrv.15.1677755177800; 
 Thu, 02 Mar 2023 03:06:17 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b003e204fdb160sm2867337wmo.3.2023.03.02.03.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:06:17 -0800 (PST)
Message-ID: <20bb422e-746d-e841-5d26-ee93cb1da9ab@linaro.org>
Date: Thu, 2 Mar 2023 12:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] QGA installer fixes
Content-Language: en-US
To: Brian Wiltse <brian.wiltse@live.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
References: <20230221112157.418648-1-kkostiuk@redhat.com>
 <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
 <CAPMcbCrqgrBkABhtSxCUbroszpPhCCWJ=FXL7AJbSmxN2n-q+Q@mail.gmail.com>
 <SN4P220MB079034D6B286760E22D50411EBAC9@SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <SN4P220MB079034D6B286760E22D50411EBAC9@SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Brian, Konstantin,

On 28/2/23 23:48, Brian Wiltse wrote:
> Microsoft has a list of best practices for MSI creation which covers 
> custom actions 
> https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-best-practices#if-you-use-custom-actions-follow-good-custom-action-practices <https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-best-practices#if-you-use-custom-actions-follow-good-custom-action-practices>, The change to the custom action from an interactive command shell to a silent invocation of rundll32.exe keeps the interactive shell from being easily caught and abused, but this does not fully solve the repair from being triggered from a non admin user. There is still the potential for abuse indirectly via attacks like the Mitre documented Hijack Execution Flow technique - Path Interception by PATH Environment Variable (https://attack.mitre.org/techniques/T1574/007/ <https://attack.mitre.org/techniques/T1574/007/>), or even the abuse of potential arbitrary folder creates, file writes and deletes in user-controlled areas such as C:\ProgramData.
> 
> The Change button was removed from "Programs and Features", but the 
> cached installer in c:\windows\installer can be leveraged directly to 
> start a privileged repair with msiexec.exe as a non-administrative user. 
> Ideally, the MSI would be compiled with the Privileged property 
> https://learn.microsoft.com/en-us/windows/win32/msi/privileged 
> <https://learn.microsoft.com/en-us/windows/win32/msi/privileged> or 
> AdminUser property 
> https://learn.microsoft.com/en-us/windows/win32/msi/adminuser 
> <https://learn.microsoft.com/en-us/windows/win32/msi/adminuser> or 
> InstallPrivileges="Elevated" 
> https://wixtoolset.org/docs/v3/xsd/wix/package/ 
> <https://wixtoolset.org/docs/v3/xsd/wix/package/> or similar privilege 
> check that which would help ensure the user has proper privileges to 
> perform the repair or change action. However, since the QEMU build 
> process leverages WiXL from msitools, many of the WiX property types are 
> not currently supported to leverage as solutions ( i.e. (wixl:1077): 
> GLib-GObject-WARNING **: 17:49:05.477: g_object_set_is_valid_property: 
> object class 'WixlWixPackage' has no property named 'InstallPrivileges' 
> ). This similar to wixl issue 40 
> https://gitlab.gnome.org/GNOME/msitools/-/issues/40 
> <https://gitlab.gnome.org/GNOME/msitools/-/issues/40>.
> 
> I do see that Wixl appears to support the custom action JScriptCall. 
> This might provide for a facility for a script could be run to check if 
> the user has the proper privileges before privileged actions are taken 
> in the repair process, but this is not an ideal solution.

Does that mean this patchset is, although "not ideal", sufficient
to fix CVE-2023-0664? Or does this need more work?
(IOW, do we feel happy enough and want to merge this and forget about it?)

Konstantin, you use "Fixes: CVE-2023-0664" in two different patches.
I'm worried a downstream distrib only pick one and feel safe. Maybe
use something like "Fixes: CVE-2023-0664 (part 1 of 2)".

