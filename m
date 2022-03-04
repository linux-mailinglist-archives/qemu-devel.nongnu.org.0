Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A94CD89C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:08:54 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAU9-0004sx-7L
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAH9-0007IG-Mc; Fri, 04 Mar 2022 10:55:28 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:46821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAH8-0005KA-3Z; Fri, 04 Mar 2022 10:55:27 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeDYt-1o0Ju7446Z-00bOTO; Fri, 04 Mar 2022 16:55:17 +0100
Message-ID: <817899a7-3df0-ef00-928f-da8052811296@vivier.eu>
Date: Fri, 4 Mar 2022 16:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] qtest: replace gettimeofday with GTimer
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-3-marcandre.lureau@redhat.com>
 <ff78228f-b4f6-9bba-9efc-a06d4f339035@vivier.eu>
In-Reply-To: <ff78228f-b4f6-9bba-9efc-a06d4f339035@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WLBHTkR+Yt9uZ8IKm00pAjyxUeN+d1hO+qjTw2NhGWHOfRFXSfF
 awI9usEu9RC0qH9OSCDox0k15iPwwjcYLqu71a52Y0snhrBzb9VDddVsOLFeP+COBqhHluF
 kvkISGzPMXgihDsrGODaBfndZUmMlsZLfCj2CM6LcctyauOUNsT02Gy5vbBQNY/bPcDzm8M
 eUd4HYkcNisIeYZE2W+uA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9oNC2iVAPMw=:1pDBw576BB6jdh2VREtPJd
 tUhZ8rwQ32lYzVgRyX1RTWh+Jg844e9/wE5aqwYEHpU5IksRP5OMaA52aP328O8HW6MTFUPmu
 BaLf9EKCwMODkkhpM1dT8nWpbYLtvSXLZIUMMqEOn8vN8s9tmizO4RmOE+Y4jKNDIbuUWBStu
 nLzVYnCXwE78Wdp9K5sR+g18zmuN5Y9BC+/ptq9ID6xO13smjY999p8hg9gDDTSuHerRMy5Eh
 4qSDGOv5jFqmvGtIVIcP99fMTKwoRnRcp2wMoWLj7tgaIV1Tp1VNk9eILznakUNlXzhgii0sP
 mcup+5yn/TAW4+qD2hAAr5EMXmUB8ELvKnfP+HsqPT9i5eNWz+ASi6bvA72sn/8bXq+v9Sfus
 YvvQlP5ftTATIBw/7+PtX5C9XesSHWNs5da5T7lHUYd66VZNK2vl3RW22zpHwG3kHowRtSlyC
 Z4kGjyhEhe51eiS44ACSCJ2jeBSKMi2IKmXxCdWWVSXz2v9cT0GnKJQ0NDZCcA7VOAJaM2Dbj
 T2O9eDWoYo/7L8Q4YhZagsm46rMkfND4olYXYfsyQkxmQtf2T8InHd7XJBegSJpFlH8ZAdSUF
 gw21rDbdWcVOifO47RJ6ThIt3jpYLEiliP4cPywMssKyowoX48wACImkj4a94J2o2BqWE0Zcb
 CO+J/Te1d+NCCukUUmj/u+sHTPzhsRXpsIedtaCsie3fPQPPGy3wJgVpifaMElvj20yA=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 16:54, Laurent Vivier a écrit :
> Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> glib provides a convenience helper to measure elapsed time. It isn't
>> subject to wall-clock time changes.
>>
>> Note that this changes the initial OPENED time, which used to print the
>> current time.
>>
> 
> Time is printed using FMT_timeval ("%ld.%06ld"), but g_timer_elapsed() returns a gdouble.
> 
> Are you sure it works properly?

Sorry, I missed this part:

>> -#define FMT_timeval "%ld.%06ld"
>> +#define FMT_timeval "%.06f"

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

