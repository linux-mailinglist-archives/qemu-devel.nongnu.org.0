Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F416333098
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:03:18 +0100 (CET)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjVd-0001zD-8w
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjE0-0007B4-Q4; Tue, 09 Mar 2021 15:45:04 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:47565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjDw-0007u4-FB; Tue, 09 Mar 2021 15:45:04 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1pfy-1lLv5B3sYC-002Isp; Tue, 09 Mar 2021 21:44:54 +0100
Subject: Re: [PATCH v2] MAINTAINERS: Fix the location of tools manuals
To: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <dd85243c-860d-e915-295d-8292d0a2f36f@redhat.com>
 <dd68974a-d2df-88ea-52fc-fb8def4b4ee3@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5c2cf1c5-c61f-f291-4613-8ddddcdf5100@vivier.eu>
Date: Tue, 9 Mar 2021 21:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <dd68974a-d2df-88ea-52fc-fb8def4b4ee3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4YO2PgQMFjblQl49smdx46r89IWDrCNJI3GLde3qVJ6ZcrCOmhy
 syQspBH+YjOYkLnS6dmK2hO2I+9wUKpvZqTOvt7oVgpgtHcjxlqOn3ytcITA/5Zj/sJcgBE
 0GR+FIKngxzxfJn0DfS0C1wMnxSRrVkXmex0qNLa+bsFcPjeONkIhq/9ZfxqmtrswDsb5uU
 og3excJK3JqoiMeWOrE7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RjvEjn8U6ec=:xYw1c4x+ODTvfDuvrpUnCm
 P2oRfChmuADSQn56CvxGaZPbuN1A+t2LkDk9I92YLpr++yteI9i3t9lnyJDCK0ldCFScor4rb
 zWv2BCoBMPDtqZQgCnHuarqGmUZufTHdCsChFqOj6vX0maHcHcOPncKwLd1jVQGnlH/QlV2my
 M1yEUf2FFTlOj6c/knDcezOHBA3jfBEHnkdhf/bd2zfljkV4woLqZfBZTvqP1o7XcbXkfoGRt
 9j3r4/HeR45H8gvuJAiS7xuVXwHqd6dy0bmXb16MvIP0IHKjKRpdjkPXgv+rN+Am+Ptvs9GBX
 j7m2LI9cDVHK17JUbKp0GN//8CnPWfOgO7zxzx9dCHkKiS7rOuZL2x2DOKxlcwRCNXeHU9G01
 M9cpbQY4by+/+nylwIQNFFRAMOItP7bPIhwUCK9iJmEcfdq9XImclqp8PTLQxpXQbNXhR84iG
 zgufxOhEog==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, dgilbert@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/03/2021 à 20:48, Thomas Huth a écrit :
> On 09/03/2021 18.41, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> Any issue that prevent this of being queued?
> 
> Maybe it's just not clear who should take the patch ... CC:-ing qemu-trivial and qemu-block now,
> since I think it could go through the trivial or block tree.
> 
>> On 2/4/21 10:59 AM, Philippe Mathieu-Daudé wrote:
>>> On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
>>>> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, qemu-trace-stap.rst,
>>>> and virtiofsd.rst manuals were moved to docs/tools, so this update MAINTAINERS
>>>> accordingly.
>>>>
>>>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
>>>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>> ---
>>>> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
>>>> v2: Fixed the location of all files [philmd]
>>>>
>>>>   MAINTAINERS | 10 +++++-----
>>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 00626941f1..174425a941 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1829,7 +1829,7 @@ S: Odd Fixes
>>>>   F: hw/9pfs/
>>>>   X: hw/9pfs/xen-9p*
>>>>   F: fsdev/
>>>> -F: docs/interop/virtfs-proxy-helper.rst
>>>> +F: docs/tools/virtfs-proxy-helper.rst
> 
> FWIW:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


